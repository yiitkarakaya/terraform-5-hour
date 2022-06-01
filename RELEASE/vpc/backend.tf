terraform {
  backend "s3" {
    bucket = "terraform-backend-for-startup"
    key    = "us-east-1/vpc"
    region = "us-east-1"
  }
}
