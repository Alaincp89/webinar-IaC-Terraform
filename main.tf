# Modulos
module "nginx_server_dev" {
  source = "./nginx_server_module"

  ami_id          = "ami-06067086cf86c58e6"
  instance_type   = "t3.small"
  name_tag        = "nginx-server-dev"
  Environment_tag = "Dev"
  public_key_path = "${path.root}/nginx-server-dev.key.pub"
}

module "nginx_server_qa" {
  source = "./nginx_server_module"

  ami_id          = "ami-06067086cf86c58e6"
  instance_type   = "t3.small"
  name_tag        = "nginx-server-qa"
  Environment_tag = "qa"
  public_key_path = "${path.root}/nginx-server-qa.key.pub"
}

module "nginx_server_prod" {
  source = "./nginx_server_module"

  ami_id          = "ami-06067086cf86c58e6"
  instance_type   = "t3.small"
  name_tag        = "nginx-server-prod"
  Environment_tag = "prod"
  public_key_path = "${path.root}/nginx-server-prod.key.pub"
}

#Outputs
output "nginx_server_dev_public_ip" {
  value = module.nginx_server_dev.aws_instance_public_ip
}

output "nginx_server_qa_public_ip" {
  value = module.nginx_server_qa.aws_instance_public_ip
}

output "nginx_server_prod_public_ip" {
  value = module.nginx_server_prod.aws_instance_public_ip
}   

