variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_policy_file" {
  description = "Path to the file containing the S3 bucket policy"
  type        = string
}

variable "versioning_status" {
  description = "The versioning status for the S3 bucket"
  default     = "Enabled"
}

variable "object_ownership" {
  description = "The object ownership for the S3 bucket"
  default     = "BucketOwnerPreferred"
}

variable "bucket_acl" {
  description = "The ACL for the S3 bucket"
  default     = "private"
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm for the S3 bucket"
  default     = "AES256"
}