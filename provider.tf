provider "aws" {
  #access_key = "${var.AWS_ACCESS_KEY}"
  #secret_key = "${var.AWS_SECRET_KEY}"
  region = "${var.AWS_REGION}"
  profile = "${var.aws_profile}"

}

##----------------------------
#     Get VPC Variables
##----------------------------

#-- Get VPC ID
#data "aws_vpc" "selected" {
#  id = "${var.vpc_cidr}"
#}

#-- Get Public Subnet List
#data "aws_subnet_ids" "selected" {
 # vpc_id = "${data.aws_vpc.selected.id}"

 # tags = {
  #  Tier = "public"
# }
#}

#--- Gets Security group with tag specified by var.name_tag
#data "aws_security_group" "selected" {
 # tags = {
 #   Name = "${var.name_tag}*"
#  }
#}
 

resource "aws_instance" "server" {
    ami           = "${data.aws_ami.windows.id}"
    instance_type = "t2.medium"
  #  private_ip = "10.25.16.6"
    key_name = "${var.KEY_PAIR}"
    subnet_id = "subnet-878cccec"
    associate_public_ip_address  = "true"
  #  security_groups = ["${aws_security_group.jenk-sg.id}"]
    vpc_security_group_ids = ["${aws_security_group.SG-IIS.id}", "sg-2467d749", "sg-9e6dddf3", "sg-fe10a093"]
    #id = "${data.aws_vpc.selected.id}"
    get_password_data    = "true"
    user_data = <<EOF
    <powershell>
    winrm quickconfig -q
    winrm set winrm/config/winrs '@{MaxMemoryPerShellMB=”300″}'
    winrm set winrm/config '@{MaxTimeoutms=”1800000″}'
    winrm set winrm/config/service '@{AllowUnencrypted=”true”}'
    winrm set winrm/config/client '@{TrustedHosts="*"}'
    winrm set winrm/config/service/auth ‘@{Basic=”true”}’
    netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
    netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow
    net stop winrm
    sc.exe config winrm start=auto
    net start winrm
    Install-WindowsFeature -name Web-Server -IncludeManagementTools
    
    Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses '10.25.20.4','10.25.22.4'
    net user Administrator "P@ssw0rd1234"
 
    
    </powershell>
    EOF
    root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "true"
      }
    
    tags = {
        Name = "IIS-PROD-TEST"
      }
   connection {
         type     = "winrm"
         user     = "Administrator"
        # password = "P@ssword1234"
        # password = "${var.domain_password}"
         password = "${var.admin_password}"
     }
  
}
