/*resource "aws_vpc_dhcp_options" "ad" {
  domain_name          = "${var.domain_name}"
  domain_name_servers  = ["${var.domain_dns_ips}"]

  tags {
    Name = "ActiveDirectory"
  }
}

resource "aws_vpc_dhcp_options_association" "ad" {
  vpc_id          = "${var.VPC_ID}"
  dhcp_options_id = "${aws_vpc_dhcp_options.ad.id}"
}*/
 
