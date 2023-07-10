# Devops-Project
Devops-Project
# Devops-Project
Devops-Project


Deploy a Java web application on EKS using CI/CD Jenkins Pipeline using the following steps and high-level diagram:


1.Launched and managed Jenkins instance, installed necessary plugins, configured jobs, and managed credentials.
2.Customized Dockerfile images for MySQL and Tomcat, built and pushed images to Docker Hub.
3.Developed Jenkins pipelines using Groovy script and Jenkinsfile to automate the build, test, and deployment process.
4.Prepared Kubernetes YAML files for deploying applications to Kubernetes clusters on AWS EKS.
5.Troubleshot and resolved issues related to Jenkins pipelines, Docker containers, and Kubernetes clusters.
 
Infastructure:
```
Service-account
VPC
region: us-east-2
zones: us-east-2a, us-east-2b, us-east-2c
3 publics-subnets (management, restricted)
internet-gatway
firewall (eksctl Allow ssh and http for nodes  by making seciritygroups allowed from the VPC created in the three subnets)
EKS from AWS
```
1) Build dockerfiles and push it to dockerhub
```
 docker build . -t ahmedmohsen98/vp-app:latest
 docker push ahmedmohsen98/vp-app:latest
 docker build . -t ahmedmohsen98/mysql:v1.0
 docker push ahmedmohsen98/mysql:v1.0
```
2) ssh to the vm and install awscli, EKS and kubectl 
```
sudo apt update
sudo apt install awscli -y
aws configure #Add iam user key for project
 sudo apt-get install kubectl
eksctl create cluster -n ahmed-mohsen --nodegroup-name ng --region us-east-2 --node-type t3.small --nodes 2
```
3)Connect to the jenkins
```
#ssh to jenkins instance
install jenkins
#open it from it's public ip on it's default port 8080 and add credentials
```

4)Build the pipeline
```
put yor github and dockerhub credentials
build the pipeline with pipeline script (Jenkinsfile) and add this repo : https://github.com/Ahmedmohsen74563/Devops-Project.git
```

5)Connect to the App
```
after 
take the ip of the loadbalancer which is created from eksctl apply command for the app service after making it's type (LoadBalancer) it will open the app web page .

```




