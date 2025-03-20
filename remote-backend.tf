terraform {
  backend "s3" {
    bucket         = "my-tf-busket"   # Make sure this bucket exists
    key            = "terraform_practice/terraform.tfstate"
    region         = "ap-south-1"     # Ensure this is the same region as your S3 and DynamoDB
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
