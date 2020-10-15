resource "aws_security_group" "ssh-acess" {
  name        = "ssh-acess"
  description = "Allow ssh acess"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_remote_acess
  }

  tags = {
    Name = "allow_ssh"
  }
}
