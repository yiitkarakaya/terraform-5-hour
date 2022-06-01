resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = var.tags
}
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1
  tags                    = var.tags
  map_public_ip_on_launch = true
}
resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2
  tags                    = var.tags
  map_public_ip_on_launch = true
}
resource "aws_subnet" "public3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet3
  tags                    = var.tags
  map_public_ip_on_launch = true
}


resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet1
  tags                    = var.tags
  map_public_ip_on_launch = false
}
resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet2
  tags                    = var.tags
  map_public_ip_on_launch = false
}
resource "aws_subnet" "private3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet3
  tags                    = var.tags
  map_public_ip_on_launch = false
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

