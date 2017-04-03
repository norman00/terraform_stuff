# - - - - - - - - - - - - - - - - - - - - - - -
# Launch configuration for JUMP box
# - - - - - - - - - - - - - - - - - - - - - - -

resource "aws_launch_configuration" "jump_lc" {
        name = "jump_lc"
        image_id = "${var.jump_ami}"
        instance_type = "${var.jump_instance_type}"
        security_groups = ["${aws_security_group.jump_sg.id}"]
        associate_public_ip_address = false
        root_block_device = {
                volume_size = "${var.jump_volume_size}"
                volume_type = "${var.jump_volume_type}"
                delete_on_termination = true
        }

        key_name = "${var.global_keypair}"
        lifecycle {
                create_before_destroy = true
        }
}

# - - - - - - - - - - - - - - - - - - - - - - -
# AutoScaling group for JUMP host
# - - - - - - - - - - - - - - - - - - - - - - -

resource "aws_autoscaling_group" "jump_asg" {
        availability_zones = "${split(",", var.global_availability_zones)}"
        name = "jump_asg"
        max_size = 2
        min_size = 1
        desired_capacity = 2
        health_check_type = "ELB"
        launch_configuration = "${aws_launch_configuration.jump_lc.name}"
        vpc_zone_identifier = ["${var.prod_private_us_east_1a}", "${var.prod_private_us_east_1b}"]
        load_balancers = ["${aws_elb.externalelb.id}"]
}
