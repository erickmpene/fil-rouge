resource "aws_eip" "prod_eip" {
  instance = var.ec2_instance_prod
  provisioner "local-exec" {
    command = "echo ${aws_eip.prod_eip.public_ip} > ./ip_address/prod_eip.txt"
  }
  tags = {
    Name = "${var.prefix_name}-eip-prod"
  }
}

resource "aws_eip" "staging_eip" {
  instance = var.ec2_instance_staging
  provisioner "local-exec" {
    command = "echo ${aws_eip.staging_eip.public_ip} > ./ip_address/staging_eip.txt"
  }
  tags = {
    Name = "${var.prefix_name}-eip-staging"
  }
}