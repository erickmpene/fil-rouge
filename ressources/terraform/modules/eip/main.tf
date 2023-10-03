resource "aws_eip" "prod_eip" {
  instance = var.ec2_instance_prod
  provisioner "local-exec" {
    command = "sed -i '/^ansible_host:/ s/ansible_host: .*/ansible_host: ${aws_eip.prod_eip.public_ip}/' ../ansible-ressources/host_vars/prod_srv.yml"
  }
  tags = {
    Name = "${var.prefix_name}-eip-prod"
  }
}

resource "aws_eip" "staging_eip" {
  instance = var.ec2_instance_staging
  provisioner "local-exec" {
    command = "sed -i '/^ansible_host:/ s/ansible_host: .*/ansible_host: ${aws_eip.staging_eip.public_ip}/' ../ansible-ressources/host_vars/staging_srv.yml"
  }
  tags = {
    Name = "${var.prefix_name}-eip-staging"
  }
}
