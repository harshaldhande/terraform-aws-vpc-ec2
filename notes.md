# AWS VPC and EC2 Infrastructure using Terraform

## AWS Provider

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

## VPC

```hcl
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc"
  }
}
```

## Public Subnet

```hcl
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-public-subnet"
  }
}
```

## Internet Gateway

```hcl
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-igw"
  }
}
```

## Route Table

```hcl
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
```

## Route Table Association

```hcl
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
```

## Security Group

```hcl
resource "aws_security_group" "ec2_sg" {
  name   = "terraform-ec2-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.15.83.5/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

## SSH Key Pair

```hcl
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("terraform-key.pub")
}
```

## EC2 Instance

```hcl
resource "aws_instance" "web" {
  ami                         = "ami-0fc5120b2d80d4749"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = aws_key_pair.terraform_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "terraform-ubuntu-ec2"
  }
}
```

## Outputs

```hcl
output "vpc_id" {
  value = aws_vpc.main.id
}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
```

## Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```
