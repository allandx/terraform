resource "aws_db_instance" "alpha_db_instance" {
  allocated_storage          = var.allocated_storage
  storage_type               = var.storage_type
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  identifier                 = var.identifier
  username                   = var.username
  password                   = var.password
  deletion_protection        = var.deletion_protection
  publicly_accessible        = var.publicly_accessible
  backup_retention_period    = var.backup_retention_period
}

