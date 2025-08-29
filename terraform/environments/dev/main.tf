terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Networking Module
module "networking" {
  source = "../../modules/networking"
  
  environment            = var.environment
  vpc_cidr               = var.vpc_cidr
  public_subnet_cidrs    = var.public_subnet_cidrs
  private_subnet_cidrs   = var.private_subnet_cidrs
  availability_zones     = var.availability_zones
}

# Compute Module
module "compute" {
  source = "../../modules/compute"
  
  environment            = var.environment
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  private_subnet_ids    = module.networking.private_subnet_ids
  alb_security_group_id = module.networking.alb_security_group_id
  web_security_group_id = module.networking.web_security_group_id
  
  instance_type     = var.instance_type
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
  key_name         = var.key_name
  db_endpoint      = module.database.db_endpoint
}

# Database Module
module "database" {
  source = "../../modules/database"
  
  environment                 = var.environment
  vpc_id                     = module.networking.vpc_id
  private_subnet_ids         = module.networking.private_subnet_ids
  database_security_group_id = module.networking.database_security_group_id
  
  db_name                    = var.db_name
  db_username               = var.db_username
  db_password               = var.db_password
  db_instance_class         = var.db_instance_class
  allocated_storage         = var.allocated_storage
  backup_retention_period   = var.backup_retention_period
  multi_az                  = var.multi_az
}

# Monitoring Module
module "monitoring" {
  source = "../../modules/monitoring"
  
  environment               = var.environment
  alb_arn_suffix           = module.compute.alb_zone_id
  target_group_arn_suffix  = module.compute.target_group_arn
  autoscaling_group_name   = module.compute.autoscaling_group_name
  notification_email       = var.notification_email
}