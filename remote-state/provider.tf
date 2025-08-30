terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }
    backend "s3" {
      bucket         = "my-sample-bucket-yashpatel-9f32df5e1bd77995"
      key            = "terraform.tfstate"
      region        = "us-west-2"
    }
  
}

provider "aws" {
  region = var.region
}
