# change values accordingly
aws_profile             = "profile in aws console config"
aws_region              = "xx-yyyy-z"

vpc_id                  = "vpc-ID here"
vpc_name                = "l-o-l"

pix_ami                 = "ami-xxxxxxxx"
pix_instance_type       = "t2.micro"
pix_volume_size         = "30"
pix_volume_type         = "gp2"
pix_ip                  = "xxx.xxx.xxx.xxx"
pix_subnet_id           = "subnet-zzzzzzzz"
pix_cidr_blocks         = "###.##.##.#/##"

jump_ami                = "ami-yyyyyyyy"
jump_instance_type      = "t2.micro"
jump_volume_size        = "30"
jump_volume_type        = "gp2"
prod_private_us_east_1a = "subnet-lllllll"
prod_private_us_east_1b = "subnet-oooooooo"
jump_cidr_blocks        = "###.##.##.#/##,###.##.##.#/##"

global_keypair             = "name_keys"
global_availability_zones  = "xx-yyyy-z,oo-pppp-q"
global_private_subnets    = "###.##.##.#/##,###.##.##.#/##"
global_public_subnets     = "###.##.##.#/##,###.##.##.#/##"
global_contact_tag        = "user@domain.com"
global_environment_tag    = "env"
global_product_tag        = "product-tag"

external_ips_allowed    = "xxx.xx.xx.xxx/32,xxx.xx.xx.xxx/32,..."
