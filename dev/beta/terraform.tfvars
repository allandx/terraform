# Create rds
rds_instances = {
  db1 = {
    allocated_storage          = 10
    storage_type               = "gp2"
    engine                     = "mysql"
    engine_version             = "5.7"
    instance_class             = "db.t2.micro"
    auto_minor_version_upgrade = true
    identifier                 = "db-proj-beta"
    username                   = "admin_beta"
    deletion_protection        = true
    publicly_accessible        = false
    backup_retention_period    = 7
  }
  # add additional db instances as required below. For e.g.:
  #   db2 = {
  #     allocated_storage           = 10
  #     storage_type                = "gp2"
  #     engine                      = "mysql"
  #     engine_version              = "5.7"
  #     instance_class              = "db.t2.micro"
  #     auto_minor_version_upgrade  = true
  #     identifier                  = "db-proj-alpha22"
  #     username                    = "admin_alpha22"
  #     deletion_protection         = true
  #     publicly_accessible         = false
  #     backup_retention_period     = 7
  #   }
}

# Create s3
bucket_name       = "s3-proj-beta"
versioning_status = "Enabled"
object_ownership  = "BucketOwnerPreferred"
bucket_acl        = "private"
sse_algorithm     = "AES256"
