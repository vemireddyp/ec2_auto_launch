resource "aws_security_group" "all" {
name="all"
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
cidr_blocks = ["0.0.0.0/0"]
}
vpc_id = "vpc-05a81be78057299ff" 
tags {
Name = "rdp"
}
}

