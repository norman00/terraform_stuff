# - - - - - - - - - - - - - - - - - - - - - - -
# Creating security groups
# - - - - - - - - - - - - - - - - - - - - - - -

resource "aws_security_group" "elb_sg" {
        name = "elb_sg"
        description = "Authorize RDP access to the Elastic Load Balancer"
        ingress {
                from_port = 3389
                to_port = 3389
                protocol = "TCP"
                cidr_blocks = "${split(",", var.external_ips_allowed)}"
        }
        egress {
                from_port = 3389
                to_port = 3389
                protocol = "TCP"
# No se pueden usar security_groups por que cycle
                cidr_blocks = "${split(",", var.jump_cidr_blocks)}"
        }
        vpc_id = "${var.vpc_id}"
}

resource "aws_security_group" "jump_sg" {
        name = "jump_sg"
        description = "Authorize RDP access from ELB into JUMP instances"
        ingress {
                from_port = 3389
                to_port = 3389
                protocol = "TCP"
                security_groups = ["${aws_security_group.elb_sg.id}"]
        }
        egress {
                from_port = 3389
                to_port = 3389
                protocol = "TCP"
                cidr_blocks = ["${var.pix_cidr_blocks}"]
#                security_groups = ["${aws_security_group.pix_sg.id}"]
        }
        egress {
                from_port = 3389
                to_port = 3389
                protocol = "TCP"
                security_groups = ["${aws_security_group.elb_sg.id}"]
        }
        vpc_id = "${var.vpc_id}"
}

resource "aws_security_group" "pix_sg" {
        name = "pix_sg"
        description = "Authorize RDP access to the PIX Server from JUMP boxes"
        ingress {
                from_port = 3389
                to_port = 3389
                protocol = "TCP"
                security_groups = ["${aws_security_group.jump_sg.id}"]
#                cidr_blocks = ["${var.jump_cidr_blocks}"]
        }
        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }
        vpc_id = "${var.vpc_id}"
}
