terraform {

  required_version = ">= 1.0.0"

  required_providers {
   
       aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "paytrack"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "sre-remote-state"
    key    = "pipeline-github/terraform.tfstate"
    region = "us-east-1"
  }
}