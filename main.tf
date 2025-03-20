provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs              = var.availability_zones
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false

  tags = var.common_tags
}

module "vote_service_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  name        = "vote-service"
  description = "Security group for vote service"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [var.vpc_cidr]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "Vote Service App Ports"
      cidr_blocks = var.vpc_cidr
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = var.vpc_cidr # Changed to vpc_cidr
    },
  ]
  egress_rules = ["all-all"]
}
