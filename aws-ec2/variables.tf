variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "instance_ami" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-01102c5e8ab69fb75"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
