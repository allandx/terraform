# For rds
variable "rds_instances" {
  description = "A map of configurations for RDS instances"
  type = map(object({
    allocated_storage          = number
    storage_type               = string
    engine                     = string
    engine_version             = string
    instance_class             = string
    auto_minor_version_upgrade = bool
    identifier                 = string
    username                   = string
    deletion_protection        = bool
    publicly_accessible        = bool
    backup_retention_period    = number
    # Add other variables as needed
  }))
}

# For s3
variable "bucket_name" {
  description = "Name of the S3 bucket for Project Alpha"
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