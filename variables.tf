variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "my-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to apply to resources"
  default = {
    Environment = "dev"
  }
}

