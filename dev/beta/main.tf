#create rds
module "beta_rds" {
  source = "../../modules/rds"
  for_each = var.rds_instances

  allocated_storage          = each.value.allocated_storage
  storage_type               = each.value.storage_type
  engine                     = each.value.engine
  engine_version             = each.value.engine_version
  instance_class             = each.value.instance_class
  auto_minor_version_upgrade = each.value.auto_minor_version_upgrade
  identifier                 = each.value.identifier
  username                   = each.value.username
  password                   = random_password.rds_password[each.key].result
  deletion_protection        = each.value.deletion_protection
  publicly_accessible        = each.value.publicly_accessible
  backup_retention_period    = each.value.backup_retention_period
}
# Terraform requires the rds password to be provided at the start when running apply 
# Passwords are generated at parent module instead of child, for single rds instance or more than 1
resource "random_password" "rds_password" {
  for_each = var.rds_instances
  length   = 16
  special  = true
}

# Create s3 
# s3 policies are attached as files so different s3 configurations can attach differnt files as needed
module "beta_s3" {
  source             = "../../modules/s3"
  bucket_name        = var.bucket_name
  bucket_policy_file = "s3_policy.json"
}
