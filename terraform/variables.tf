
variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "c7i-flex.large"
}

variable "ami_id" {
  description = "Amazon Linux 2023 x86_64 AMI"
  type        = string
  default     = "ami-0c230065b91270bc6"
}

variable "project_name" {
  description = "Name of the capstone project"
  type        = string
  default     = "capstone_project"
}

variable "my_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
  default     = "capstone-project-key"
}
