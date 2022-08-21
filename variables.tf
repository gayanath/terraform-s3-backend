variable "main_bucket_name" {
  type = string
}

variable "replica_bucket_name" {
  type    = string
  default = ""
}

variable "iam_role_name" {
  type    = string
  default = "TerraformStateReplication"
}

variable "iam_policy_name" {
  type    = string
  default = "TerraformStateReplication"
}

variable "locks_table_name" {
  type    = string
  default = "TerraformStateLocks"
}

