variable "AWS_REGION" {
  type        = "string"
  description = "The AWS region to deploy into (e.g. us-east-1)"
  default     = "us-east-1"
}

variable "project" {
  type        = "string"
  description = "Name of the project these resources are being created for"
  default     = "Application-Name"
}

variable "purpose" {
  type        = "string"
  description = "The role the resources will play"
  default     = "N/A"
}

variable "creator" {
  type        = "string"
  description = "Person creating these resources"
  default     = "email?"
}

variable "environment" {
  type        = "string"
  description = "Context these resources will be used in, e.g. production"
  default     = "Development"
}

variable "freetext" {
  type        = "string"
  description = "Information that does not fit in the other tags"
  default     = "N/A"
}

variable "port" {
  type        = "string"
  description = "The port on which targets receive traffic."
  default     = "80"
}

variable "protocol" {
  type        = "string"
  description = "The protocol to use for routing traffic to the targets."
  default     = "TCP"
}

variable "vpc_id" {
  type        = "string"
  description = "The identifier of the VPC in which to create the target group."
  default     = "vpc-id"
}

variable "health_check_interval" {
  type        = "string"
  description = "The approximate amount of time, in seconds, between health checks of an individual target."
  default     = "10"
}

variable "health_check_protocol" {
  type        = "string"
  description = "The protocol to use to connect with the target."
  default     = "TCP"
}

# variable "health_check_timeout" {
# type        = "string"
# description = "The amount of time, in seconds, during which no response means a failed health check. NOTE custom timeout is not supported for target_groups with TCP protocol"
# default     = "10"
#}

variable "health_check_healthy_threshold" {
  type        = "string"
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  default     = "2"
}

variable "unhealthy_threshold" {
  type        = "string"
  description = "The number of consecutive health check failures required before considering the target unhealthy."
  default     = "2"
}

variable "name" {
  type        = "string"
  description = "Name that you want to tag on the load balancer."
  default     = "NetworkLB-Terraform"
}

variable "lbname" {
  type        = "string"
  description = "Name that you want to give to the load balancer."
  default     = "NetworkLB-Terraform"
}

variable "load_balancer_type" {
  type        = "string"
  description = "Type of load balancer you want to use e.g. application or network."
  default     = "network"
}

variable "subnets" {
  type        = "list"
  description = "Which subnets to use for the load balancer e.g..subnet-id"
  default     = ["subnet-id"]
}
