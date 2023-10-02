#Ici vous pouvez surcharger les variables.

prefix_name     = "ic-group"
public_ip_allow = "0.0.0.0/0"
vpc_cidr_block  = "172.16.0.0/16"
private_subnets = "172.16.0.0/20"
public_subnets  = "172.16.32.0/20"
az-a            = "eu-west-3a"
http_port_ic-webapp       = 80
http_port_pgadmin      = 30601
http_port_postgres = 5432
http_port_odoo = 30600
ssh_port        = 22

ingress_all_ip  = "0.0.0.0/0"
egress_all_ip   = "0.0.0.0/0"
key_name                      = "bootcamp"              # put your key here
ami                           = "ami-0fc067f03ad87bb64" # put your ami here 
instance_type                 = "t2.micro"
associate_public_ip_address   = "true"

