resource "aws_vpc" "main" {
  cidr_block       = var.CIDR_Block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.dns_support
  enable_dns_hostnames = var.dns_hostname
  tags = var.tags
}
#security group for postgress RDS 5432
resource "aws_security_group" "allow_postgress" {
  name        = "allow_postgress"
  description = "Allow TLS inbound postgress traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.postgress_port
    to_port          = var.postgress_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_list
  }
  tags = var.tags
}

