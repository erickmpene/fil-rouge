resource "aws_instance" "odoo_postgres_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address

  provisioner "remote-exec" {
  inline = [
      "sudo apt update -y",
      "sudo apt install -y git nano tree net-tools htop curl wget ", 
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sh get-docker.sh",
      "sudo usermod -aG docker ubuntu", 
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo init 6"
  ]
  connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("/home/cool/key/bootcamp.pem")
      host = self.public_ip
  }
}

  tags = {
    Name        = "${var.prefix_name}-odoo_postgres-ec2"
  }
}
