resource "aws_s3_bucket" "test-demo" {
  bucket = "servarcbucket23"
  acl    = "private"

  tags = {
    Name        = "Test-Bucket"
    Environment = "Dev"
    Builder     = ""
  }
}
