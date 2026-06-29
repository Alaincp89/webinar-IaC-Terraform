# Variables
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-06067086cf86c58e6"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.medium"
}

variable "name_tag" {
  description = "Name tag for the EC2 instance"
  default     = "Nginx-Server"
}

variable "Environment_tag" {
  description = "Environment tag for the EC2 instance"
  default     = "Test"
}

variable "Team_tag" {
  description = "Team tag for the EC2 instance"
  default     = "NTT DATA"
}

variable "Owner_tag" {
  description = "Owner tag for the EC2 instance"
  default     = "Alain Cervantes"
}

variable "Project_tag" {
  description = "Project tag for the EC2 instance"
  default     = "Server Nginx"
}

variable "public_key_path" {
  description = "Ruta al archivo .pub de la key SSH"
  type        = string
}