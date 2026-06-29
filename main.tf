provider "aws" {
  region = "us-east-1"
  
}

# Create instance
resource "aws_instance" "nginx-server" {
  ami           = "ami-08f44e8eca9095668"
  instance_type = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
            EOF

  key_name = aws_key_pair.nginx-server-ssh-key.key_name

  vpc_security_group_ids = [aws_security_group.nginx-server_sg.id]

  tags = {
    Name = "Nginx-Server"
    Environment = "Test"
    Owner = "Alain Cervantes"
    Team = "Dtt DevOps"
    Project = "Test Terraform"
  }
}

# Create a key pair for SSH access
resource "aws_key_pair" "nginx-server-ssh-key" {
  key_name   = "nginx-server-ssh-key"
  public_key = file("nginx-server.key.pub")

  tags = {
    Name = "Nginx-Server-SSH-Key"
    Environment = "Test"
    Owner = "Alain Cervantes"
    Team = "Dtt DevOps"
    Project = "Test Terraform"
  }
}

# Security group
resource "aws_security_group" "nginx-server_sg" {
  name        = "nginx-server_sg"
  description = "allow ssh on 22 & http on port 80"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Nginx-Server-sg"
    Environment = "Test"
    Owner = "Alain Cervantes"
    Team = "Dtt DevOps"
    Project = "Test Terraform"
  }
}

# Outputs
output "aws_instance_public_dns" {
  value = aws_instance.nginx-server.public_dns
}

output "aws_instance_public_ip" {
  value = aws_instance.nginx-server.public_ip
}