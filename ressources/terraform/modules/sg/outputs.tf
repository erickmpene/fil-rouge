output "sg_allow_http_ic_group" {
    value = aws_security_group.allow_http_ic-webapp.id
}

output "sg_allow_http_pgadmin" {
    value = aws_security_group.allow_http_pgadmin.id
}
output "sg_allow_http_odoo" {
    value = aws_security_group.allow_http_odoo.id
}

output "sg_allow_http_postgres" {
    value = aws_security_group.allow_http_postgres.id
}
output "sg_allow_ssh" {
    value = aws_security_group.allow_ssh.id
}

output "sg_allow_ping" {
    value = aws_security_group.allow_ping.id
}