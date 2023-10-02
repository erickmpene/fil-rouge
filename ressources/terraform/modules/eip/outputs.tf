output "eip_prod_ec2" {
    value = aws_eip.prod_eip.id
}

output "eip_staging_ec2" {
    value = aws_eip.staging_eip.id
}