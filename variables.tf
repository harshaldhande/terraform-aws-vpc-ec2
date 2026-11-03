
variable "aws_region" {
  description = "AWS region for infrastructure"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
}

variable "ssh_cidr" {
  description = "Your public IP address in CIDR format"
  type        = string
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
}

