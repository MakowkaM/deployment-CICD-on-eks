#!/bin/bash
sudo yum update -y

#-------- GIT
sudo yum install git -y

#-------- JENKINS
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo dnf upgrade
# Add required dependencies for the Jenkins package
sudo dnf install fontconfig java-21-openjdk
sudo dnf install jenkins
sudo systemctl daemon-reload

#-------- TERRAFORM
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform -y

#-------- MAVEN
sudo yum install maven -y

#-------- KUBECTL
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

#-------- EKSCTL
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" -o eksctl.tar.gz
tar -xzf eksctl.tar.gz
sudo mv eksctl /usr/local/bin

#-------- HELM
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

#-------- DOCKER
sudo dnf install docker -y
sudo systemctl start docker
sudo systemctl enable docker

#-------- TRIVY
wget https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.50.1_Linux-64bit.tar.gz
tar zxvf trivy_0.50.1_Linux-64bit.tar.gz
sudo mv trivy /usr/local/bin/

#-------- SONARQUBE
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community

#-------- AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install