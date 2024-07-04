terraform {
  backend "s3" {
    bucket = "apptestbacket"
    key    = "eks/terraform.tfvars"
    region = "us-east-1"
  }
}