# Multi-Environment-Web-Application-Using-Terraform

This repository contains Terraform code to provision a scalable and highly available infrastructure on AWS. The infrastructure is designed to host a web application and includes networking, compute, database, and monitoring components.

## Architecture

The infrastructure is composed of the following AWS resources:

- **VPC:** A Virtual Private Cloud (VPC) to provide an isolated network environment.
- **Subnets:** Public and private subnets across multiple Availability Zones for high availability.
- **Internet Gateway:** To provide internet access to the public subnets.
- **NAT Gateway:** To allow instances in the private subnets to access the internet for updates.
- **Application Load Balancer (ALB):** To distribute incoming traffic across the web servers.
- **Auto Scaling Group:** To automatically scale the number of web servers based on CPU utilization.
- **EC2 Instances:** Web servers running a generic Amazon Linux 2 AMI.
- **RDS Instance:** A MySQL database for data persistence, configured for high availability with Multi-AZ.
- **CloudWatch:** For monitoring and alerting.

## Modules

The Terraform code is organized into modules for better reusability and maintainability:

- **`networking`:** Creates the VPC, subnets, route tables, internet gateway, NAT gateway, and security groups.
- **`compute`:** Provisions the Application Load Balancer, Auto Scaling Group, and launch template for the web servers.
- **`database`:** Sets up the RDS MySQL database, including a DB subnet group and parameter group.
- **`monitoring`:** Configures a CloudWatch dashboard and alarms for monitoring the application's health.

## Environments

The repository is structured to support multiple environments, such as `dev` and `prod`. Each environment has its own directory under `terraform/environments`, with its own `main.tf`, `variables.tf`, and `terraform.tfvars` files. This allows for environment-specific configurations.

## Prerequisites

Before you can use this Terraform code, you need to have the following:

- **AWS Account:** An active AWS account with the necessary permissions to create the resources defined in the code.
- **Terraform:** Terraform installed on your local machine.
- **AWS CLI:** The AWS Command Line Interface (CLI) installed and configured with your AWS credentials.

## Usage

To deploy the infrastructure, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/PreciousDipe/Multi-Environment-Web-Application-Using-Terraform.git
   cd Multi-Environment-Web-Application-Using-Terraform
   ```

2. **Navigate to the desired environment directory:**
   ```bash
   cd terraform/environments/dev
   ```

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Review the plan:**
   ```bash
   terraform plan
   ```

5. **Apply the changes:**
   ```bash
   terraform apply
   ```

To destroy the infrastructure, run the following command in the environment directory:

```bash
terraform destroy
```
