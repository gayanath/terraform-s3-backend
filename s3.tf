module "main_bucket" {
  source             = "github.com/gayanath/terraform-private-s3-bucket"
  bucket_name        = var.main_bucket_name
  versioning_enabled = true
  lifecycle_enabled  = true
  providers = {
    aws.this = aws.main
  }
}

module "replica_bucket" {
  count              = local.replica_enabled ? 1 : 0
  source             = "github.com/gayanath/terraform-private-s3-bucket"
  bucket_name        = var.replica_bucket_name
  versioning_enabled = true
  lifecycle_enabled  = true
  providers = {
    aws.this = aws.replica
  }
}
