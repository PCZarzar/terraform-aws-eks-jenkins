terraform {
  backend "s3" {
    bucket = "terraform-aws-eks-jenkins-s3"
    key    = "jenkins-CICD/terraform.tfstate"
    region = "us-east-1"
  }
}