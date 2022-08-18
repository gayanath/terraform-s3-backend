resource "aws_iam_role" "replication_role" {
  count    = local.replica_enabled ? 1 : 0
  provider = aws.main
  name     = var.iam_role_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "replication_policy" {
  count    = local.replica_enabled ? 1 : 0
  provider = aws.main
  name     = var.iam_policy_name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${module.main_bucket.bucket_arn}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionTagging"
      ],
      "Effect": "Allow",
      "Resource": [
        "${module.main_bucket.bucket_arn}/*"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Effect": "Allow",
      "Resource": "${module.replica_bucket[0].bucket_arn}/*"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "replication" {
  count      = local.replica_enabled ? 1 : 0
  provider   = aws.main
  name       = "tf-state-bucket-replication"
  roles      = [aws_iam_role.replication_role[0].name]
  policy_arn = aws_iam_policy.replication_policy[0].arn
}