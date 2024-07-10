#!/bin/bash

# Update packages
sudo yum update -y

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade packages after adding the repository
sudo yum upgrade -y

# Install Java
sudo amazon-linux-extras install java-openjdk11 -y

# Install Jenkins
sudo yum install jenkins -y

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Git
sudo yum install git -y

# Install necessary utilities
sudo yum install -y yum-utils

# Add HashiCorp repository
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# Install Terraform
sudo yum -y install terraform

# Download kubectl
sudo curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl"

# Make kubectl executable
sudo chmod +x ./kubectl

# Move kubectl to a directory in the PATH
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin