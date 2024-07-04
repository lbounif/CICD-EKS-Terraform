terraform {
  backend "s3" {
    bucket = "apptestbacket"
    key    = "jenkins-server/terraform.tfvars"
    region = "us-east-1"
  }
}