data "aws_ami" "windows" {
  filter {
      name   = "name"
      values = ["Windows_Server-2016-English-Full-Base-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]

}
  most_recent = true
  owners = ["amazon"] # Amazon account ID
}
  


 
 
