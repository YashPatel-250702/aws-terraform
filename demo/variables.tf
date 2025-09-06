variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "bucketName" {
  description = "The name of the S3 bucket"
  type        = string
  default     =  "my-sample-bucket-yashpatel"
}

variable "eacardLocation" {
  description = "The location of the eHealthCard file"
  type        = string
  default     = "./TKWRKS1150_Yash Patel.pdf"
}

variable "eacardKey" {
  description = "The key for the eHealthCard object in S3"
  type        = string
  default     = "eHealthCard.pdf"
}
