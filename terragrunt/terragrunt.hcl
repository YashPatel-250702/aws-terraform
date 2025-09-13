generate "provider "{
    path = "provider.tf"
    if_exists = "overwrite-terragrunt"
    contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

generate "s3_backend" {
    path = "backend.tf"
    if_exists = "overwrite-terragrunt"
    contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-01dc"
    key            = "${path.relative_to_include}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true

  }
}
EOF 
}