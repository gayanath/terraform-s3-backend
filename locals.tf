locals {
  replica_enabled        = var.replica_bucket_name != "" ? true : false
  replica_bucket_arn     = local.replica_enabled ? module.replica_bucket[0].bucket_arn : ""
  replication_role_arn   = local.replica_enabled ? aws_iam_role.replication_role[0].arn : ""
  replication_policy_arn = local.replica_enabled ? aws_iam_policy.replication_policy[0].arn : ""
}