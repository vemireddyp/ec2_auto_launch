# AWS credentials
AWS_ACCESS_KEY = "AKIA6GN5GZ7SY3MANGB6"
AWS_SECRET_KEY = "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"
AWS_REGION = "eu-west-3"
KEY_PAIR = "EUW03S-260419"
INSTANCE_PASSWORD = "Password1234"

# Availability zones
#az1 = "ap-southeast-1a"
#az2 = "ap-southeast-1b"

# VPC
VPC_ID = "vpc-05a81be78057299ff"

subnet_cidr_inside1 = "10.25.20.0/23"
subnet_cidr_inside2 = "10.25.22.0/23"

subnet_cidr_dmz1 = "10.25.16.0/23"
subnet_cidr_dmz2 = "10.25.18.0/23"
domain_dns_ips = ["10.25.20.4", "10.25.22.4"]

#trusted_ip_address  = "1.2.3.4/32"

# Directory Service
domain_name     = "aws.sprue.com"
domain_password  = "P@ssword1234"
dir_type            = "MicrosoftAD"
domain_ou_path     = "OU=sprue,DC=computers,DC=DMZ"
domain_username = "Administrator"
