resource "aws_instance" "odoo_postgres_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  # provisioner "remote-exec" {
  #   inline = [
  #       "sudo apt update",
  #       "sudo apt install nginx -y",
  #       "sudo systemctl start nginx",
  #       "sudo systemctl enable nginx"
  #   ]
  #   connection {
  #       type = "ssh"
  #       user = "ubuntu"
  #       private_key = file("/home/cool/key/bootcamp.pem")
  #       host = self.public_ip
  #   }
  # }
  tags = {
    Name        = "${var.prefix_name}-odoo_postgres-ec2"
  }
}
