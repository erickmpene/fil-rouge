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

# resource "aws_volume_attachment" "ebs_att" {
#   device_name = "/dev/sdh"
#   volume_id   = var.ebs
#   instance_id = aws_instance.ec2.id
# }

# data "aws_ami" "ubuntu-bionic-latest" {
#   most_recent = true
#   owners = [var.ami_owner]
#   filter {
#     name = "name"
#     values = [var.ami_owner_name ]
#   }
#   filter {
#     name = "virtualization-type"
#     values = [var.ami_owner_virtualization_type]
#   }
#   filter {
#     name = "root-device-type"
#     values = [var.ami_owner_root_device_type]
#   } 
# }