variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_ami" {
  description = "AMI ID for the instance"
  type        =  string
  default     = "ami-01102c5e8ab69fb75"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  validation {
    condition     =  var.instance_type == "t2.micro" || var.instance_type == "t2.small"
    error_message = "Allowed values for instance_type are: t2.micro, t2.small."
  }
}

variable "root_block_config" {
  description = "value for root_block_device"
  type = object({
    v_size = number
    v_type = string
  })
  default = {
    v_size = 20
    v_type = "gp2"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}

}

locals {
  name="MyInstance"
}