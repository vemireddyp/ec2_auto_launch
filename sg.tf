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
to_port = 0
protocol = "-1"
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
cidr_blocks = ["10.25.16.0/23"]
}  
ingress {
from_port = 3389
to_port = 3389
protocol = "tcp"
cidr_blocks = ["94.125.134.81/32"]
}
ingress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["35.180.88.0/21"]
}  
vpc_id = "vpc-05a81be78057299ff" 
tags = {
Name = "rdp"
}
}

