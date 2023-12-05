
module "iam_users" {
  source = "../modules/iam_users"
  users  = var.users
  groups = var.groups
}
