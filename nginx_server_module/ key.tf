# Create a key pair for SSH access
resource "aws_key_pair" "nginx-server-ssh-key" {
  key_name   = "${var.name_tag}-ssh-key"
  public_key = file(var.public_key_path)

  tags = {
    Name        = "${var.name_tag}-ssh-key"
    Environment = var.Environment_tag
    Owner       = var.Owner_tag
    Team        = var.Team_tag
    Project     = var.Project_tag
  }
}
