terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
  cloud {
    organization = "jtz-sb1"

    workspaces {
      name = "learn-private-module-root"
    }
  }
}


provider "aws" {
  region = var.region
}

module "s3-webapp" {
  source  = "app.terraform.io/jtz-sb1/s3-webapp/aws"
  name        = var.name
  region = var.region
  prefix = var.prefix
  version = "1.0.0"
}

module "s3-webapp-dot1" {
  source  = "app.terraform.io/jtz-sb1/s3-webapp/aws"
  version = "1.0.1"
  name        = "${var.name}-dot1"
  region = var.region
  prefix = var.prefix
}

module "s3-webapp-dot3" {
  source  = "app.terraform.io/jtz-sb1/s3-webapp/aws"
  version = "1.0.3"
  name        = "${var.name}-dot3"
  region = var.region
  prefix = var.prefix
}