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
  user_data                   = file("docker.sh")

  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.key_path)
    host        = self.public_ip
  }

  tags = merge(
    local.common_tags,
    {
      Name = "terraform_instance"
    }
  )
}