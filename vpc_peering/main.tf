data "aws_caller_identity" "accountc" {
  provider = aws.accountc
}

data "aws_region" "accountc" {
  provider = aws.accountc
}

data "aws_route_tables" "accountb-accountc" {
  provider = aws.accountb
  vpc_id   = var.accountb_map["vpc_id"]
}

data "aws_route_tables" "accounta-accountc" {
  provider = aws.accounta
  vpc_id   = var.accounta_map["vpc_id"]
}

data "aws_route_tables" "accountc-accounta" {
  provider = aws.accountc
  vpc_id   = var.accountc_map["vpc_id"]
}

data "aws_route_tables" "accountc-accountb" {
  provider = aws.accountc
  vpc_id   = var.accountc_map["vpc_id"]
}

# -------------------------------------
# Initiate request from Account A to C
# -------------------------------------
resource "aws_vpc_peering_connection" "accounta" {
  provider      = aws.accounta
  vpc_id        = var.accounta_map["vpc_id"]
  peer_vpc_id   = var.accountc_map["vpc_id"]
  peer_owner_id = data.aws_caller_identity.accountc.account_id
  peer_region   = data.aws_region.accountc.id
  auto_accept   = false

  tags = {
    Name = "accounta - accountc VPC peering"
  }
}

# -------------------------------------
# Accept request on Account C
# -------------------------------------
resource "aws_vpc_peering_connection_accepter" "accountc" {
  provider                  = aws.accountc
  vpc_peering_connection_id = aws_vpc_peering_connection.accounta.id
  auto_accept               = true

  tags = {
    Name = "accountc - accounta VPC peering"
  }
}

# -------------------------------------
# Initiate request from Account B to C
# -------------------------------------
resource "aws_vpc_peering_connection" "accountb" {
  provider      = aws.accountb
  vpc_id        = var.accountb_map["vpc_id"]
  peer_vpc_id   = var.accountc_map["vpc_id"]
  peer_owner_id = data.aws_caller_identity.accountc.account_id
  peer_region   = data.aws_region.accountc.id
  auto_accept   = false

  tags = {
    Name = "VPC peering from Account B to C"
  }
}

# -------------------------------------
# Accept request on Account C
# -------------------------------------
resource "aws_vpc_peering_connection_accepter" "accountc-accountb" {
  provider                  = aws.accountc
  vpc_peering_connection_id = aws_vpc_peering_connection.accountb.id
  auto_accept               = true

  tags = {
    Name = "VPC peering from Account C to B"
  }
}
