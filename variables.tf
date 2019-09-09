#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}
variable "KEY_PAIR" {}
variable "INSTANCE_USERNAME" {default = "admin"}
variable "INSTANCE_PASSWORD" {}
#variable "vpc_cidr" {}

#variable "subnet_cidr" {
  #description = "cidr blocks for subnet"
  #default = "10.25.20.0/23"
#  }

variable "volume_type" {
  description = "The type of volume. Can be standard gp2 or io1 or sc1st1"
  default = "standard"
}

variable "VPC_ID" {
  description = "cidr blocks for vpc"
  default = "10.25.16.0/21"
  }


variable "volume_size" {
  description = "size of the ebs volume needed"
  default = "50"
  } 

variable "aws_profile" {
  description = "Set the aws cli profile to use"
  default = "644383991727"
}


variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}



variable "domain_name" {
  description = "Domain name"
}

variable "domain_ou_path" {
  description = "Domain OU path"
}

variable "domain_dns_ips" {
  description = "Domain DNS IPs"
  type = "list"
}




variable "domain_username" {
  description = "Domain username"
}

variable "domain_password" {
  description = "Domain password"
}















