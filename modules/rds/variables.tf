variable "allocated_storage" {
  description = "The amount of storage allocated to the RDS instance (in GB)"
  type        = number
}

variable "storage_type" {
  description = "The storage type to be used for the RDS instance"
  type        = string
}

variable "engine" {
  description = "The name of the database engine to be used for the RDS instance"
  type        = string
}

variable "engine_version" {
  description = "The version number of the database engine to be used for the RDS instance"
  type        = string
}

variable "instance_class" {
  description = "The instance class of the RDS instance"
  type        = string
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance"
  type        = bool
}

variable "identifier" {
  description = "A unique identifier for the RDS instance"
  type        = string
}

variable "username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "deletion_protection" {
  description = "Indicates whether deletion protection is enabled for the RDS instance"
  type        = bool
}

variable "publicly_accessible" {
  description = "Indicates whether the RDS instance can be publicly accessible"
  type        = bool
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups"
  type        = number
}


