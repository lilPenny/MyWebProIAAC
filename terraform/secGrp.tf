resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "web-sg inbound traffic and outbound traffic"

  tags = {
    Name = "web-sg"
  }
}

data "aws_security_group" "exising-sg" {
  name = "ansible-sg"
}

resource "aws_vpc_security_group_ingress_rule" "sshFromMyIp" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = var.myIp
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "sshfromexisting" {
  security_group_id            = aws_security_group.web-sg.id
  referenced_security_group_id = data.aws_security_group.exising-sg.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = var.myIp
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = var.myIp
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}