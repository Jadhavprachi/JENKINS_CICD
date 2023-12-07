terraform {
  backend "s3" {
    bucket         = "myproject-cicd"
    key            = "my-terraform-environment/main"
    region         = "us-east-1"
    dynamodb_table = "myproject-cicd-dynamo-db-table"
  }
}
