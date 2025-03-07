variable "bucket_name" {
  description = "The name of the bucket"
  type = string
}


variable "dynamodb_name" {
  description = "The name of the DynamoDB database"
  type = string
}

variable "billing_mode" {
  description = "The mode of the billing"
  type = string
}

variable "hash_key" {
  description = "The hash key of the dynamodb"
  type = string
}