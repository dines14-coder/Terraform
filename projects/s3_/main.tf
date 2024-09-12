resource "aws_s3_bucket" "buck1" {
  bucket = var.bucket_name

  tags = {
    Name        = "public access demo"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "buckv" {
  bucket = aws_s3_bucket.buck1.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_ownership_controls" "boc" {
  bucket = aws_s3_bucket.buck1.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bpa" {
  bucket = aws_s3_bucket.buck1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bacl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.boc,
    aws_s3_bucket_public_access_block.bpa,
  ]

  bucket = aws_s3_bucket.buck1.id
  acl    = "public-read-write"
}