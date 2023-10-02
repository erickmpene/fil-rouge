provider "aws" {
  region = "eu-west-3"
}

module "ec2-web" {
  source                        = "./modules/ec2-web"
  prefix_name                   = var.prefix_name
  vpc_id                        = module.vpc.vpc_id
  ami                           = var.ami
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  subnet_id                     = module.vpc.public_subnets
  associate_public_ip_address   = var.associate_public_ip_address
  vpc_security_group_ids        = ["${module.sg.sg_allow_http_ic_group}", "${module.sg.sg_allow_http_pgadmin}", "${module.sg.sg_allow_ssh}"]

}
module "ec2-odoo" {
  source                        = "./modules/ec2-odoo"
  prefix_name                   = var.prefix_name
  vpc_id                        = module.vpc.vpc_id
  ami                           = var.ami
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  subnet_id                     = module.vpc.public_subnets
  associate_public_ip_address   = var.associate_public_ip_address
  vpc_security_group_ids        = ["${module.sg.sg_allow_http_postgres}", "${module.sg.sg_allow_http_odoo}", "${module.sg.sg_allow_ssh}"]

}
module "vpc" {
  source          = "./modules/vpc"
  prefix_name     = var.prefix_name
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  az-a            = var.az-a

}

# module "ebs" {
#   source      = "./modules/ebs"
#   az-a        = var.az-a
#   size_ebs    = var.size_ebs
#   prefix_name = var.prefix_name
# }

module "eip" {
  source       = "./modules/eip"
  ec2_instance_ic-webapp_pgadmin = module.ec2-web.ic-webapp_pgadmin_ec2
  ec2_instance_odoo_postgres_ec2 = module.ec2-odoo.odoo_postgres_ec2
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





