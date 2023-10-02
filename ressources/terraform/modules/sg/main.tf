resource "aws_security_group" "allow_http_ic-webapp" {
  description = "security group allow http-ic-webapp"
  name        = "${var.prefix_name}-allow_http-ic-webapp"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.http_port_ic-webapp
    to_port     = var.http_port_ic-webapp
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]

  }
  tags = {
    Name        = "${var.prefix_name}-allow-http-ic-webapp"
  }

}
resource "aws_security_group" "allow_http_pgadmin" {
  description = "security group allow http-pgadmin"
  name        = "${var.prefix_name}-allow_http-pgadmin"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.http_port_pgadmin
    to_port     = var.http_port_pgadmin
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]
    }
  tags = {
    Name        = "${var.prefix_name}-allow-http-pgadmin"
  }
}
resource "aws_security_group" "allow_http_odoo" {
  description = "security group allow http-odoo"
  name        = "${var.prefix_name}-allow_http-odoo"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.http_port_odoo
    to_port     = var.http_port_odoo
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]

  }
  tags = {
    Name        = "${var.prefix_name}-allow-http-odoo"
  }

}
resource "aws_security_group" "allow_http_postgres" {
  description = "security group allow http-postgres"
  name        = "${var.prefix_name}-allow_http-postgres"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.http_port_postgres
    to_port     = var.http_port_postgres
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]
    }
  tags = {
    Name        = "${var.prefix_name}-allow-http-postgres"
  }
}

resource "aws_security_group" "allow_ssh" {
  description = "security group allow ssh"
  name        = "${var.prefix_name}-allow_ssh"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]

  }
  tags = {
    Name        = "${var.prefix_name}-allow-ssh-ec2"
  }

}

resource "aws_security_group" "allow_ping" {
  description = "security group allow ping"
  name        = "${var.prefix_name}-allow_ping"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["82.65.209.216/32"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]
  }
  tags = {
    Name        = "${var.prefix_name}-allow-ping-ec2"
  }

}