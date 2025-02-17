pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage('Checkout SCM'){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/PCZarzar/terraform-aws-eks-jenkins.git']])
                }
            }
        }
        stage('Initializing'){
            steps{
                script{
                    dir('EKS-cluster'){
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Formatting Code'){
            steps{
                script{
                    dir('EKS-cluster'){
                        sh 'terraform fmt'
                    }
                }
            }
        }
        stage('Validating Code'){
            steps{
                script{
                    dir('EKS-cluster'){
                        sh 'terraform validate'
                    }
                }
            }
        }
        stage('Previewing the Infra'){
            steps{
                script{
                    dir('EKS-cluster'){
                        sh 'terraform plan'
                    }
                    input(message: "Are you sure to proceed?", ok: "Proceed")
                }
            }
        }
        stage('Creating EKS Cluster'){
            steps{
                script{
                    dir('EKS-cluster') {
                        sh 'terraform apply --auto-approve'
                    }
                }
            }
        }
        stage('Deploying Game Application') {
            steps{
                script{
                    dir('EKS-cluster/DeployGame') {
                        sh 'aws eks update-kubeconfig --name my-eks-cluster'
                        sh 'kubectl apply -f deployment.yaml'
                        sh 'kubectl apply -f service.yaml'
                    }
                }
            }
        }
    }
}