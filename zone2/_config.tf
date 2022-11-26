terraform {
  backend "s3" {
    bucket = "nguyenlc1-sre-us-west-1"
    key    = "terraform/terraform.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = local.tags
  }
}
