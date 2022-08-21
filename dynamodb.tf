resource "aws_dynamodb_table" "terraform_locks" {
  name           = var.locks_table_name
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}