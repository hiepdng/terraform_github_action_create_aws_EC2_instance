## Automate create AWS EC2 Instance using Terraform and GitHub Actions  

This is a complete setup to create AWS EC2 instance using Terraform and GitHub Actions.

**Requirements:**  
Add your AWS credentials to your GitHub repository  
- AWS_ACCESS_KEY_ID: Your AWS access key
- AWS_SECRET_ACCESS_KEY: Your AWS secret access key

<br/>

#### <ins>Method 1:</ins> Deploy AWS EC2 Instance using CLI  
- Set Up AWS Authentication:  
    Run the below command and follow the instruction.  
```
aws configure
```
- Copy the main.tf to the current directory.  
- Deploy AWS EC2 Instance:  
```
tarraform init
terraform plan
terraform apply -auto-approve
```

- Destroy AWS EC2 Instance
```
terraform init
terraform plan -destroy
terraform destroy -auto-approve
```

#### <ins>Method 2:</ins> Deploy AWS EC2 Instance using GitHub Actions
- The provided GitHub Action is for deploying the AWS EC2 Instance and they are triggered by workflow_dispatch. Change to other trigger option if you wish.
- There are two Gihub Actions workflow files (deploy.yml and destroy.yml).
    - deploy.yml: Deploy the AWS EC2 Instance.
    - destroy.yml: Destroy AWS EC2 Instance.

<br/>

**Checking:**  
```
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId,Type,PublicIpAddress]" --output table
aws ec2 describe-instance-status
aws ec2 describe-instance-status --instance-ids <instance-ID>
aws ec2 describe-instances
aws ec2 describe-instances --instance-ids <instance-ID>
```
