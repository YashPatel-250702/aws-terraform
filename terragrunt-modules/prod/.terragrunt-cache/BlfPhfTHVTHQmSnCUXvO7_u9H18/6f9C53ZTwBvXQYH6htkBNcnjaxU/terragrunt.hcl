include {
  path = find_in_parent_folders()
}

inputs = {
  instance_type = "t2.micro"
  ami           = "ami-0123456789abcdef0"
  environment   = "prod"
}