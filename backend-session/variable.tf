
variable "aws_instance_type" {
  description = "Type of AWS instance"
  type        = string

  validation {
    condition= var.aws_instance_type == "t2.micro" 
    error_message = "Instance type must be t2.micro"
  }

}