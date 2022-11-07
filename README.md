# Provision EKS Cluster with Terraform
In this demo, we will deploy an AWS EKS Cluster based on the following diagram:
![](./Lab_Results/EKS.png) 
## About EKS
AWS EKS deploys and manages K8s cluster with easy and quickly set-up. So we get rid of complex configuration of K8s cluster. 
Amazon EKS runs the Kubernetes management infrastructure across multiple AWS Availability Zones, so we don't need to maintain K8s Control Plane.

The infrastructure running on Amazon EKS is secure by default by setting up a secure and encrypted communication channel between worker nodes & Kubernetes endpoint.

Applications managed by Amazon EKS are fully compatible with applications managed by any standard K8s environment.
## Instructions
1. Clone the project 
```
git clone https://github.com/mehdijebali/Terraform-EKS.git
```
2. In the project root directory, create an SS key and name it **levelup_key**
```
ssh-keygen
``` 
3. Export your AWS Credentials
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
4. In the project root directory, initiate Terraform in order to install the declared provider in `provider.tf` file
```
terraform init
```
5. If you want to see your provisionning details, run the following command
```
terraform plan
```
6. Apply modifications
```
terraform apply
```