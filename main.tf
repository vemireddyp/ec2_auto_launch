
provider "aws" {
  access_key = "AKIA6GN5GZ7SY3MANGB6"
  secret_key = "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"
  region = "eu-west-3"
  profile = "975891255269"

}
# Create VPC
resource "aws_vpc" "vpc-test" {
  cidr_block = "10.25.16.0/21"
  enable_dns_hostnames = "true"
  tags {
    Name = "VPC-TEST"
  }
}
#Create Subnets
resource "aws_subnet" "subnet 1" {
  vpc_id = "${aws_vpc.vpc-test.id}"
  cidr_block = "10.25.16.0/23"
 tags {
   Name = "DMZ1-test"
}
}
resource "aws_subnet" "subnet 2" { 
  vpc_id = "${aws_vpc.vpc-test.id}"
  cidr_block = "10.25.18.0/23"
 tags {
   Name = "DMZ2-test"
}
}
resource "aws_subnet" "subnet 3" {
  vpc_id = "${aws_vpc.vpc-test.id}"
  cidr_block = "10.25.20.0/23"
 tags {
   Name = "Inside1-test"
}
}
resource "aws_subnet" "subnet 4" {
  vpc_id = "${aws_vpc.vpc-test.id}"
  cidr_block = "10.25.22.0/23"
 tags {
   Name = "Inside2-test"
}
}

#Create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc-test.id}"
  tags {
    Name = "IGW-test"
    }
  }
#Create network ACLs
resource "aws_network_acl" "nacl" {
  vpc_id = "${aws_vpc.vpc-test.id}"

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "NetworkACL-test"
  }
}

