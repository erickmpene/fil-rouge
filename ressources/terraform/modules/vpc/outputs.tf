output "vpc_id" {
    value = aws_vpc.vpc_bootcamp.id 
}

output "private_subnets" {
    value = aws_subnet.private_subnets.id
}

output "public_subnets" {
    value = aws_subnet.public_subnets.id
}