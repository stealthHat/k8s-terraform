resource "aws_security_group" "ssh-acess" {
  name        = "ssh-acess"
  description = "Allow ssh acess"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["191.249.65.42/32"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
