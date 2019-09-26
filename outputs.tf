output "image_id" {
    value = "${data.aws_ami.windows.id}"
}
output "instance_ip_address" {
    value = "${data.aws_instance.server.public_ip}"
    }    

 
#output#
