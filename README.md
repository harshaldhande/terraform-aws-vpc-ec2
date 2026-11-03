# AWS VPC and EC2 Infrastructure Automation using Terraform

## 📌 Project Overview

This project demonstrates the automation of AWS infrastructure provisioning using **Terraform (Infrastructure as Code)**.

The project creates a custom Virtual Private Cloud (VPC), public subnet, Internet Gateway, route table, security group, SSH key pair, and an Ubuntu EC2 instance in the AWS Mumbai region.

The infrastructure is provisioned and managed using Terraform.

## 🏗️ Architecture

```text
                     Internet
                        |
                        |
                Internet Gateway
                        |
                        |
                 Public Route Table
                        |
                        |
                 Public Subnet
                 10.0.1.0/24
                        |
                        |
                  EC2 Instance
                  Ubuntu 24.04
                    t3.micro
                        |
                        |
                Security Group
                 SSH Port 22
```

### AWS Infrastructure Components

| Resource | Description |
|---|---|
| AWS VPC | Custom Virtual Private Cloud |
| Public Subnet | Subnet for hosting the EC2 instance |
| Internet Gateway | Enables internet connectivity |
| Route Table | Routes internet traffic through the IGW |
| Security Group | Controls inbound and outbound traffic |
| Key Pair | Enables SSH authentication |
| EC2 Instance | Ubuntu virtual server |

## 🛠️ Technologies Used

- AWS
- Terraform
- AWS CLI
- Git
- GitHub
- Ubuntu Linux
- Infrastructure as Code (IaC)

## 📂 Project Structure

```text
terraform-aws-vpc-ec2/
│
├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── terraform-key
├── terraform-key.pub
├── .gitignore
├── .terraform.lock.hcl
└── README.md
```

> Sensitive files such as `terraform.tfvars`, the private SSH key, and Terraform state files are excluded from GitHub using `.gitignore`.

## ⚙️ Prerequisites

Before deploying this project, install:

- Terraform
- AWS CLI
- Git
- An AWS account

Configure AWS authentication before running Terraform commands.

## 🚀 Deployment Steps

### 1. Clone the Repository

```bash
git clone https://github.com/harshaldhande/terraform-aws-vpc-ec2.git
```

### 2. Navigate to the Project Directory

```bash
cd terraform-aws-vpc-ec2
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate the Configuration

```bash
terraform validate
```

### 5. Format the Terraform Files

```bash
terraform fmt -recursive
```

### 6. Review the Execution Plan

```bash
terraform plan
```

### 7. Deploy the Infrastructure

```bash
terraform apply
```

Review the plan and enter `yes` when prompted.

## 📤 Terraform Outputs

Terraform provides the following outputs after deployment:

- VPC ID
- EC2 Instance ID
- EC2 Public IP Address
- EC2 Public DNS

These outputs help identify and access the deployed infrastructure.

## 🔐 Security Considerations

- SSH access is restricted using a specific public IP address CIDR.
- Private SSH keys are not committed to GitHub.
- Terraform state files are excluded from version control.
- AWS credentials are not stored in the repository.
- IAM users or roles with least-privilege permissions should be used.
- Avoid exposing SSH port 22 to `0.0.0.0/0`.

## 🧹 Infrastructure Cleanup

To delete the infrastructure created by Terraform:

```bash
terraform destroy
```

Review the resources Terraform plans to destroy and enter `yes` when prompted.

> This command deletes the infrastructure managed by the current Terraform configuration. Ensure that no required resources or data will be lost.

## 🎯 Learning Outcomes

- Understanding AWS VPC networking
- Creating public subnets and route tables
- Configuring Internet Gateway connectivity
- Launching EC2 instances using Terraform
- Managing AWS infrastructure using Infrastructure as Code
- Using Terraform variables and outputs
- Version controlling infrastructure code using Git and GitHub

## 👨‍💻 Author

**Harshal Dhande**

GitHub: [harshaldhande](https://github.com/harshaldhande)

## ⭐ Project

AWS VPC and EC2 Infrastructure Automation using Terraform
