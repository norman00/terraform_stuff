# -------------------------------------
# Requesters info
# -------------------------------------

variable "accountb_map" {
  type = map(any)
  default = {
    owner_id    = "############"
    vpc_id      = "vpc-1y2y3y4y"
    cidr        = "##.##.##.#/##"
    region      = "xx-yyyy-z"
    environment = "env1"
  }
}

variable "accountb_route_table_ids" {
  description = "Route table IDs of the requestor"
  type        = list(any)
  default     = []
}

variable "accounta_map" {
  type = map(any)
  default = {
    owner_id    = "############"
    vpc_id      = "vpc-1x2x3x4x"
    cidr        = "##.##.##.#/##"
    region      = "xx-yyyy-z"
    environment = "env2"
  }
}

variable "accounta_route_table_ids" {
  description = "Route table IDs of the requestor"
  type        = list(any)
  default     = []
}

# -------------------------------------
# Accepter info
# -------------------------------------

variable "accountc_map" {
  type = map(any)
  default = {
    owner_id    = "############"
    vpc_id      = "vpc-1z2z3z4z"
    cidr        = "##.##.##.#/##"
    region      = "xx-yyyy-z"
    environment = "env3"
  }
}

variable "accountc_route_table_ids" {
  description = "Route table IDs of the peer"
  type        = list(any)
  default     = []
}

variable "auto_accept_peering" {
  description = "Whether to auto-accept the peering request"
  default     = true
}

# -------------------------------------
# Credentials exported as env vars on
# Terraform cloud
# -------------------------------------

# Account B
variable "accountb_access_key" {
  description = "Access key for accountb account"
  type        = string
  sensitive   = true
}

variable "accountb_secret_key" {
  description = "Secret key for accountb account"
  type        = string
  sensitive   = true
}

# Account C
variable "accountc_access_key" {
  description = "Access key for accountc account"
  type        = string
  sensitive   = true
}

variable "accountc_secret_key" {
  description = "Secret key for accountc account"
  type        = string
  sensitive   = true
}
