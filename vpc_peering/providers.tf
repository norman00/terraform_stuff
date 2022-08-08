terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.22.0"
    }
  }
  
  # Using terraform cloud
  cloud {
    organization = "OrgName"

    workspaces {
      name = "vpc-workplace-name"
    }
  }
}

provider "aws" {
  alias  = "accounta"
  region = "xx-yyyy-z"
}

provider "aws" {
  alias      = "accountb"
  region     = "xx-yyyy-z"
  access_key = var.accountb_access_key
  secret_key = var.accountb_secret_key
}

provider "aws" {
  alias      = "accountc"
  region     = "xx-yyyy-z"
  access_key = var.accountc_access_key
  secret_key = var.accountc_secret_key
}
