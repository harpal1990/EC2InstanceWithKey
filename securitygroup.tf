### Creating Security Group ###
resource "aws_security_group" "Web" {
  name        = "Web_SG"
  description = "Security Group for Web"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Port for SG"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
}