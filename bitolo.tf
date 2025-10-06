provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "default" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "default" {
  name        = "default_sg"
  description = "Allow SSH and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "default" {
  ami                    = data.aws_ami.default.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name = "elvis_instance"
  }
}
