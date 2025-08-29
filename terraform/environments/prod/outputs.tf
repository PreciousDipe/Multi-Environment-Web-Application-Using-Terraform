output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.compute.alb_dns_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "database_endpoint" {
  description = "Database endpoint"
  value       = module.database.db_endpoint
}

output "website_url" {
  description = "Website URL"
  value       = "http://${module.compute.alb_dns_name}"
}

output "dashboard_url" {
  description = "CloudWatch Dashboard URL"
  value       = module.monitoring.dashboard_url
}