terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "webpro21"
    key    = "terraform.tfstate"
    region = var.region
  }
}

provider "aws" {
  region = var.region
}