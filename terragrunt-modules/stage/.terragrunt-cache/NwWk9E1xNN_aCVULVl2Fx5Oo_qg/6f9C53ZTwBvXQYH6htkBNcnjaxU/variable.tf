variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
}

variable "ami" {
  type        = string
  description = "AMI ID for EC2 instance"
}

variable "environment" {
  type        = string
  description = "Environment name (prod/stage)"
}
