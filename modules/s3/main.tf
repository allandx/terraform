
resource "aws_s3_bucket" "project_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.project_bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.project_bucket.id
  rule {
    object_ownership = var.object_ownership
  }
}

# To block public access
# Use resource "aws_s3_bucket_public_access_block" is better
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls]

  bucket = aws_s3_bucket.project_bucket.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.project_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

data "aws_s3_bucket" "project_bucket_data" {
  bucket = aws_s3_bucket.project_bucket.bucket
}

resource "aws_s3_bucket_policy" "project_bucket_policy" {
  bucket = data.aws_s3_bucket.project_bucket_data.id
  policy = file(var.bucket_policy_file)
}
