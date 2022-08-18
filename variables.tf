variable "main_bucket_name" {
  type = string
}

variable "replica_bucket_name" {
  type    = string
  default = ""
}

variable "iam_role_name" {
  type    = string
  default = "terraform-state-bucket-replication"
}

variable "iam_policy_name" {
  type    = string
  default = "terraform-state-bucket-replication"
}

