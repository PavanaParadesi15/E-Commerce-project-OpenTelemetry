## Creating S3 bucket for storing state file in the S3 bucket - Backend
# "s3_bucket" is not the name of the S3 bucket, its the name of the resource "S3"

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = false
  }
}


## Creating DynamoDB for State file locking
# "dynamodb-table" is the name of the resource "Dynamo DB" . Its not the table name

resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.dynamodb_name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key

  attribute {
    name = "LockId"
    type = "S"
  }

}
