resource "aws_security_group" "SG-IIS" {
name="SG-IIS-TEST-STG"
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

vpc_id = "vpc-8ddd5ce6" 
tags = {
Name = "SG-IIS-TEST-STG"
}
}

/*resource "aws_security_group_rule" "jenk-sg" {
   type = "ingress"
     from_port = 0
      to_port = 0
     protocol = "-1"
     cidr_blocks = ["35.180.88.59/32"]
     security_group_id = "${aws_security_group.SG-IIS.id}"
  }*/

  

