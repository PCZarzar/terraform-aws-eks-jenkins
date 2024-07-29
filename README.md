# Terraform AWS EKS Jenkins

This project uses Terraform to create infrastructure on AWS consisting of a VPC with a Jenkins instance and another VPC for an EKS cluster. The Jenkins instance is configured to access AWS, and a pipeline is created to deploy a basic game accessible via Load Balancer.

## Overview

- **VPC 1**: Contains a Jenkins instance.
- **VPC 2**: Contains an EKS cluster.
- **Jenkins**: Configured to access AWS and perform deployments.
- **Pipeline**: Defined in a Jenkinsfile, it performs commands and deploys a game.

## Prerequisites

- Terraform installed.
- AWS CLI configured.
- AWS credentials with necessary permissions.
- GitHub repository with the basic game code and Jenkinsfile.

## Project Structure

- `EKS-cluster`: Contains Terraform files to configure the EKS cluster.
- `Jenkins-instance`: Contains Terraform files to configure the Jenkins instance.
- `Jenkinsfile`: Defines the Jenkins pipeline for game deployment.
- `README.md`: This documentation file.

## Usage Instructions

### VPC and Jenkins Instance Setup

1. Clone this repository:
    ```sh
    git clone https://github.com/PCZarzar/terraform-aws-eks-jenkins.git
    cd terraform-aws-eks-jenkins
    ```

2. Navigate to the `Jenkins-instance` directory and apply Terraform:
    ```sh
    cd Jenkins-instance
    terraform init
    terraform apply
    ```

### EKS Cluster Setup

1. Navigate to the `EKS-cluster` directory and apply Terraform:
    ```sh
    cd ../EKS-cluster
    terraform init
    terraform apply
    ```

### Jenkins Configuration and Deployment

1. Access the created Jenkins instance and configure AWS credentials.
2. Add the GitHub repository and Jenkinsfile to Jenkins.
3. Run the pipeline defined in the Jenkinsfile to deploy the game.

## Contribution

Contributions are welcome! Feel free to open issues and submit pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

