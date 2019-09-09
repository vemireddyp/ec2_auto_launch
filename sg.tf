resource "aws_security_group" "SG-IIS" {
name="SG-IIS"
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 0
to_port = 6556
protocol = "tcp"
cidr_blocks = ["94.125.134.81/32"]
}
ingress {
from_port = 0
to_port = 6556
protocol = "tcp"
cidr_blocks = ["10.25.20.0/32"]
}  
ingress {
from_port = 0
to_port = 6556
protocol = "tcp"
cidr_blocks = ["10.25.16.0/21"]
}  
vpc_id = "vpc-62026006" 
tags = {
Name = "rdp"
}
}

