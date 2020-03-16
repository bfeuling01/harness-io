variable "access_key" {}
variable "secret_key" {}

variable "region" {
  type        = "string"
  description = "AWS Region required by Terraform AWS Provider"
  default     = "us-east-1"
  }

variable "s3_bucket_region" {
  type        = "string"
  description = "Region where S3 bucket will be created used to store remote state file"
  default     = "us-east-1"
  }

variable "s3_bucket_name" {
  type        = "string"
  description = "Name of the S3 bucket to be created used to store the remote state file"
  default     = "rc-tf-bucket-training-exersize-1"
  }

variable "tag_env" {
  type        = "string"
  description = "Tag for Environment Name"
  default     = "training"
  }
