# -------------------
# Create routes from
# Account A to C
# -------------------
# Routes for requester
resource "aws_route" "accounta-accountc" {
  provider                  = aws.accounta
  count                     = length(data.aws_route_tables.accounta-accountc.ids)
  route_table_id            = tolist(data.aws_route_tables.accounta-accountc.ids)[count.index]
  destination_cidr_block    = var.accountc_map["cidr"]
  vpc_peering_connection_id = aws_vpc_peering_connection.accounta.id
}

# Routes for accepter
resource "aws_route" "accountc" {
  provider                  = aws.accountc
  count                     = length(data.aws_route_tables.accountc-accounta.ids)
  route_table_id            = tolist(data.aws_route_tables.accountc-accounta.ids)[count.index]
  destination_cidr_block    = var.accounta_map["cidr"]
  vpc_peering_connection_id = aws_vpc_peering_connection.accounta.id
}

# -------------------
# Create routes from
# Account B to C
# -------------------
# Routes for requester
resource "aws_route" "accountb-accountc" {
  provider                  = aws.accountb
  count                     = length(data.aws_route_tables.accountb-accountc.ids)
  route_table_id            = tolist(data.aws_route_tables.accountb-accountc.ids)[count.index]
  destination_cidr_block    = var.accountc_map["cidr"]
  vpc_peering_connection_id = aws_vpc_peering_connection.accountb.id
}

# Routes for accepter
resource "aws_route" "accountc-accountb" {
  provider                  = aws.accountc
  count                     = length(data.aws_route_tables.accountc-accountb.ids)
  route_table_id            = tolist(data.aws_route_tables.accountc-accountb.ids)[count.index]
  destination_cidr_block    = var.accountb_map["cidr"]
  vpc_peering_connection_id = aws_vpc_peering_connection.accountb.id
}
