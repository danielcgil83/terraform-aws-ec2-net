resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "this" {
  ami                         = var.instance_ami
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  associate_public_ip_address = true

  tags = merge(
    local.common_tags,
    {
      Name = "terraform_instance"
    }
  )
}