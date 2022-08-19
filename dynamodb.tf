resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform-locks"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}