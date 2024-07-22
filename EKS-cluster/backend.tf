terraform {
  backend "s3" {
    bucket = "terraform-aws-eks-jenkins-s3"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}