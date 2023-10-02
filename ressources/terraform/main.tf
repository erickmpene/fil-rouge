provider "aws" {
  region = "eu-west-3"
}

module "ec2-prod" {
  source                        = "./modules/ec2-prod"
  prefix_name                   = var.prefix_name
  vpc_id                        = module.vpc.vpc_id
  ami                           = var.ami
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  subnet_id                     = module.vpc.public_subnets
  associate_public_ip_address   = var.associate_public_ip_address
  vpc_security_group_ids        = ["${module.sg.sg_allow_ping}", "${module.sg.sg_allow_http_pgadmin}", "${module.sg.sg_allow_ssh}", "${module.sg.sg_allow_http_postgres}", "${module.sg.sg_allow_http_odoo}"]

}
module "ec2-staging" {
  source                        = "./modules/ec2-staging"
  prefix_name                   = var.prefix_name
  vpc_id                        = module.vpc.vpc_id
  ami                           = var.ami
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  subnet_id                     = module.vpc.public_subnets
  associate_public_ip_address   = var.associate_public_ip_address
  vpc_security_group_ids        = ["${module.sg.sg_allow_ping}", "${module.sg.sg_allow_http_pgadmin}", "${module.sg.sg_allow_ssh}", "${module.sg.sg_allow_http_postgres}", "${module.sg.sg_allow_http_odoo}"]

}
module "vpc" {
  source          = "./modules/vpc"
  prefix_name     = var.prefix_name
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  az-a            = var.az-a
}

module "eip" {
  source       = "./modules/eip"
  ec2_instance_prod = module.ec2-prod.prod_ec2
  ec2_instance_staging = module.ec2-staging.staging_ec2
  prefix_name  = var.prefix_name
}

module "sg" {
  source         = "./modules/sg"
  prefix_name    = var.prefix_name
  http_port_ic-webapp      = var.http_port_ic-webapp
  http_port_pgadmin    = var.http_port_pgadmin
  http_port_postgres = var.http_port_postgres
  http_port_odoo = var.http_port_odoo
  ssh_port       = var.ssh_port
  vpc_id         = module.vpc.vpc_id
  ingress_all_ip = var.ingress_all_ip
  egress_all_ip  = var.egress_all_ip
 

}





