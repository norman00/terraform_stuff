#--------------------------------------------------------------
# PIX server instance
#--------------------------------------------------------------
resource "aws_instance" "pix-server" {
  ami = "${var.pix_ami}"
  instance_type = "${var.pix_instance_type}"
  key_name = "${var.global_keypair}"
  subnet_id = "${var.pix_subnet_id}"
  security_groups = ["${aws_security_group.pix_sg.id}"]
  associate_public_ip_address = false
  private_ip = "${var.pix_ip}"
  root_block_device {
    volume_size = "${var.pix_volume_size}"
    volume_type = "${var.pix_volume_type}"
    delete_on_termination = false
  }

  tags {
    Contact               = "${var.global_contact_tag}"
    Environment           = "${var.global_environment_tag}"
    Name                  = "pix-server-primary-prod"
    Product               = "${var.global_product_tag}"
  }

  lifecycle {
    ignore_changes = ["user_data"]
  }
}
