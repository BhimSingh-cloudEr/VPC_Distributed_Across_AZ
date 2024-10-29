variable "aws_region" {
  description = "AWS region to deploy the resources"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "192.168.0.0/26"
}
