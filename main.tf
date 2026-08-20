terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# 1. Provision the EC2 instance (AWS will initially start it)
resource "aws_instance" "my_insta_instance" {
  ami           = "ami-0c7217cdde317cfec" # Replace with your valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Created-Not-Running"
  }
}

# 2. Immediately intercept and transition the instance to a "stopped" state
resource "aws_ec2_instance_state" "stop_my_instance" {
  instance_id = aws_instance.my_insta_instance.id
  state       = "stopped"

# Explicit dependency prevents race conditions during deployment
  depends_on = [aws_instance.my_insta_instance]
}
