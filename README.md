# terraform-s3-backend
Setup S3 buckets and a DynamoDB table for a Terraform backend.

## Limitations
* Both `aws.main` and `aws.replica` provider configurations need to be provided even when the replication is not used.
