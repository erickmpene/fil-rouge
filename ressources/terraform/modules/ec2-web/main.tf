resource "aws_instance" "ic_webapp_pgadmin_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  tags = {
    Name        = "${var.prefix_name}-ic-webapp_pgadmin-ec2"
  }
}
