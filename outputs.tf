output "image_id" {
    value = "${data.aws_ami.windows.id}"
}
out "ip" {
    value = "data.aws_instance.server.publicipaddress"
    }    

 
#output#
