variable "users" {
  description = "List of IAM users to create"
  type = list(object({
    name     = string
    role     = string
    products = list(string)
  }))
}

variable "groups" {
  description = "List of IAM user groups to create"
  type        = list(string)
}
