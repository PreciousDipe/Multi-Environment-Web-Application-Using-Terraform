environment = "prod"
aws_region  = "us-east-1"

# Network Configuration
vpc_cidr               = "10.0.0.0/16"
public_subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs   = ["10.0.10.0/24", "10.0.20.0/24"]
availability_zones     = ["us-east-1a", "us-east-1b"]

# Compute Configuration
instance_type     = "t3.micro"
min_size         = 1
max_size         = 3
desired_capacity = 1
# key_name       = "your-key-pair-name"  # Uncomment and set your key pair

# Database Configuration
db_name                    = "prodwebapp"
db_username               = "admin"
db_password               = "changeme123!"  # Change this!
db_instance_class         = "db.t3.micro"
allocated_storage         = 20
backup_retention_period   = 3
multi_az                  = false

# Monitoring Configuration
notification_email = "preciousdipe@gmail.com"