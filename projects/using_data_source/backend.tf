terraform {
  backend "s3" {
    bucket = "terra-pr-backend"
    key    = "remote/statefile"
    region = "us-east-2"
  }
}
