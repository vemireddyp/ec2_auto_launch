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
    subnet_id = "subnet-60ed6d38"
    associate_public_ip_address  = "true"
    vpc_security_group_ids = ["${aws_security_group.SG-IIS.id}"]
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
    $password = "Domainaccount123" | ConvertTo-SecureString -asPlainText -Force
    $username = "suppv"
    $credential = New-Object System.Management.Automation.PSCredential($username,$password)
    $hostname = "IIS-STG-TEST"
    Add-Computer -domainname aws.sprue.com -OUPath "OU=IIS,OU=DMZ,OU=Computers,OU=sprue,DC=aws,DC=sprue,DC=com" -NewName $hostname -DomainCredential $credential -Passthru -Verbose -Force -Restart
   ## $domainpassword = ConvertTo-SecureString "Vinayaka"123" -AsPlainText -Force 
#$secpasswd = ConvertTo-SecureString "PlainTextPassword" -AsPlainText -Force
   # $mycreds = New-Object System.Management.Automation.PSCredential ("suppv", $domainpassword)
    #Rename-Computer -NewName "IIS001" -DomainCredential $mycreds -Restart -Force
    Start-Sleep -s 300
    
    #Add-Computer -DomainName $domain -OUPath \"$ouPath\" -Credential $credential\n
   # Add-Computer -DomainName "aws.sprue.com" -OUPath "OU=sprue,DC=aws,DC=sprue,DC=com" -DomainCredential $mycreds -Restart –Force
   # Start-Sleep -s 300
    </powershell>
    EOF
    root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "true"
      }
    
    tags = {
        Name = "test-iis-server"
      }
   connection {
         type     = "winrm"
         user     = "Administrator"
         password = "P@ssword1234"
        # password = "${var.domain_password}"
        # password = "${var.admin_password}"
     }
 provisioner "file" {
    source      = "IISConfigureremote.ps1"
    destination = "C:\\IISConfigureremote.ps1"
  }
 provisioner "remote-exec" {
  connection {
    type = "winrm"
    user = "Administrator"
    host = "${aws_instance.server.public_ip}"
    password = "P@ssw0rd1234"
  }
   inline = [
    "cd c:\\",
    "powershell.exe ./IISConfigureremote.ps1",
  ]       
}
   
 

}



    
 




   

