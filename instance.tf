### create ssh-key ####
resource "aws_key_pair" "key-tf" {
    key_name = "ubuntu"
    public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
    value = "${aws_key_pair.key-tf.key_name}"
  
}

resource "aws_instance" "Web" {
    ami = var.image_id
    instance_type = var.instance_type
    key_name = aws_key_pair.key-tf.id
    security_groups = ["${aws_security_group.Web.name}"]
    tags = {
        name = "Web-Instance"
    }
  
}