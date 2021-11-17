terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  
  region              = var.region
  # allowed_account_ids = data.aws_caller_identity.current.account_id

  # assume_role {
  #   role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.iam_role}"
  # }

  ignore_tags {
    key_prefixes = ["managed:"]
  }

  default_tags {
    tags = {
      owner       = "0ni0nrings"
      created-by  = "terraform"
      uuid        = "random"
      name        = "clientvpn"
    }
  }
}