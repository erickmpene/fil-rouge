resource "aws_eip" "ic_webapp_pgadmin_eip" {
  instance = var.ec2_instance_ic-webapp_pgadmin
  provisioner "local-exec" {
    command = "echo ${aws_eip.ic_webapp_pgadmin_eip.public_ip} > ./app/ic_webapp_pgadmin_eip.txt"
  }
  tags = {
    Name = "${var.prefix_name}-eip-ic_webapp_pgadmin"
  }
}

resource "aws_eip" "odoo_postgres_eip" {
  instance = var.ec2_instance_odoo_postgres_ec2
  provisioner "local-exec" {
    command = "echo ${aws_eip.odoo_postgres_eip.public_ip} > ./app/odoo_postgres_eip.txt"
  }
  tags = {
    Name = "${var.prefix_name}-eip-odoo_postgres_eip"
  }
}