module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terraform-jenkins-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.azs.names

  private_subnets = var.private_subnets 
  public_subnets  = var.public_subnets

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"      = "1"
  }


}

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "example"
  cluster_version = "1.24"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.medium"]
    }
  }

  eks_managed_node_groups = {
    default = {}
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

}

