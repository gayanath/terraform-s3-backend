output "main_bucket_arn" {
  value = module.main_bucket.bucket_arn
}

output "replica_bucket_arn" {
  value = local.replica_bucket_arn
}

output "replication_role_arn" {
  value = local.replication_role_arn
}

output "replication_policy_arn" {
  value = local.replication_policy_arn
}