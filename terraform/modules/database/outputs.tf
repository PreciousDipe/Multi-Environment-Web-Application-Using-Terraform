output "db_endpoint" {
  description = "Database endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_port" {
  description = "Database port"
  value       = aws_db_instance.main.port
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.main.db_name
}