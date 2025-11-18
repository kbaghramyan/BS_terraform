terraform {
  backend "s3" {
    bucket = "brainscale-terraform-state"
    key    = "hotel-management/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
