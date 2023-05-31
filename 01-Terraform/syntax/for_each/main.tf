provider "aws" {
	region = "ap-northeast-2"
}

resource "aws_iam_user" "example" {
#	count = 3
#	count = length(var.user_names)
#	name = "aws08-neo.${count.index}"
#	name = var.user_names[count.index]
	for_each = toset(var.user_names)
	name = each.value
}

variable "user_names" {
	description = "Create IAM with these names"
	type = list(string)
	default = ["aws08-neo","aws08-trinity", "aws08-morpheus"]
}

output "all_user" {
	value = values(aws_iam_user.example)
	description = "The name of all users"
}


output "all_arn" {
value = values(aws_iam_user.example)[*].arn
description = "The ARN for all users"
}
