provider "aws" {
  #access_key = "${var.access_key}"
  #secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_s3_bucket" "tf-root-module-bucket" {
  bucket = "${var.s3_bucket_name}"
  acl = "private"
  region = "${var.s3_bucket_region}"
  
  versioning {
    enabled = true
  }
  
  tags = {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.tag_env}"
  }
}
