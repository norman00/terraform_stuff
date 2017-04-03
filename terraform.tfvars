# change values accordingly
aws_profile             = "profile in aws console config"
aws_region              = "us-east-1"

vpc_id                  = "vpc-ID here"
vpc_name                = "b-e-p"

pix_ami                 = "ami-11e84107"
pix_instance_type       = "t2.micro"
pix_volume_size         = "30"
pix_volume_type         = "gp2"
pix_ip                  = "172.31.28.125"
pix_subnet_id           = "subnet-e1f584ba"
pix_cidr_blocks         = "172.31.16.0/20"

jump_ami                = "ami-11e84107"
jump_instance_type      = "t2.micro"
jump_volume_size        = "30"
jump_volume_type        = "gp2"
prod_private_us_east_1a = "subnet-d699e2fb"
#subnet-e1f584ba"
prod_private_us_east_1b = "subnet-5428001d"
#subnet-e1f584ba"
jump_cidr_blocks        = "172.31.48.0/20,172.31.0.0/20"

global_keypair             = "name_keys"
global_availability_zones  = "us-east-1a,us-east-1b"
global_private_subnets    = "10.188.21.0/26,10.188.21.64/26"
global_public_subnets     = "10.188.21.128/26,10.188.21.192/26"
global_contact_tag        = "user@domain.com"
global_environment_tag    = "prod"
global_product_tag        = "country-erp"

external_ips_allowed    = "xxx.xx.xx.xxx/32,xxx.xx.xx.xxx/32,..."
