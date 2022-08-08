# -------------------------------------------------
# ELASTIC LOAD BALANCER for JUMP instances and ASG
# -------------------------------------------------

resource "aws_elb" "externalelb" {
        name = "externalelb"
        availability_zones = ["${split(",", var.global_availability_zones)}"]
        security_groups = ["${aws_security_group.elb_sg.id}"]

        listener {
                instance_port = 3389
                instance_protocol = "TCP"
                lb_port = 3389
                lb_protocol = "TCP"
        }

        health_check {
                healthy_threshold = 3
                unhealthy_threshold = 2
                timeout = 10
                target = "TCP:3389"
                interval = 60
        }

        cross_zone_load_balancing = true
        tags {
                Name = "external-elb"
                Environment = "${var.global_environment_tag}"
                Product = "${var.global_product_tag}"
                Contact = "${var.global_contact_tag}"
        }
}
