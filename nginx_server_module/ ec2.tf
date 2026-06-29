# Create instance
resource "aws_instance" "nginx-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

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
    Name = var.name_tag
    Environment = var.Environment_tag
    Owner = var.Owner_tag
    Team = var.Team_tag
    Project = var.Project_tag
  }
}
