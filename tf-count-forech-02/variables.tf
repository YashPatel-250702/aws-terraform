variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

    variable "private_subnet_count" {
  description = "Number of private subnets to create"
  type        = number

}

variable "private_subnet_cidrs" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
  
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  
}
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "ec2_config" {
  description = "Configuration for EC2 instances"
  type = map(object({
    instance_type = string
    ami       = string
  }))
}
