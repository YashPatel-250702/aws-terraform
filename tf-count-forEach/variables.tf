variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  
}

variable "subnet1_cidr" {
  description = "CIDR block for Subnet 1"
  type        = list(string)
  default     = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  validation {
    condition     =  var.instance_type == "t2.micro" || var.instance_type == "t2.small"
    error_message = "Allowed values for instance_type are: t2.micro, t2.small."
  }

}