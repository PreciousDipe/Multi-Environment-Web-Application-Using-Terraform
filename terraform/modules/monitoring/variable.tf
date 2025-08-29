variable "environment" {
  description = "Environment name"
  type        = string
}

variable "alb_arn_suffix" {
  description = "ALB ARN suffix for monitoring"
  type        = string
}

variable "target_group_arn_suffix" {
  description = "Target group ARN suffix for monitoring"
  type        = string
}

variable "autoscaling_group_name" {
  description = "Auto Scaling Group name"
  type        = string
}

variable "notification_email" {
  description = "Email for notifications"
  type        = string
  default     = ""
}