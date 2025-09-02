
resource "aws_instance" "MyInstance" {
  ami = var.instance_ami
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    volume_size = var.root_block_config.v_size
    volume_type = var.root_block_config.v_type
  }

  tags = merge({
    Name = local.name
  }, var.additional_tags)
}