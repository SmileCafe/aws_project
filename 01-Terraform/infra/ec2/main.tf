terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # Backend Information
  backend "s3" {
    bucket = "aws08-terraform-state"
    key    = "infra/ec2/terraform.tfstate"
    region = "ap-northeast-2"
    # applying dynamoDB created before
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
