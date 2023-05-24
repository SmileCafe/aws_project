provider "aws" {
	region = "ap-northeast-2"
}

data "aws_vpc" "default" {
	filter {
		name = "tag:Name"
		values = ["604-vpc"]
	}	
}

data "aws_subnets" "example" {
	filter {
		name = "vpc-id"
		values = [data.aws_vpc.default.id]
	}
}

data "aws_subnet" "example" {
	for_each = toset(data.aws_subnets.example.ids)
	id			 = each.value
}

output "subnets" {
	value = data.aws_subnets.example.ids
}

# output "subnet_cidr_blocks" {
#	value = [for s in data.aws_subnet.example : s.cidr_block]
# }

#output "vpc-cidr_blck" {
#	value = data.aws_vpc.default.cidr_block
#}
 
#output "subnet_cidr_blocks" {
#	value = values(data.aws_subnet.example)[*].cidr_block
#}

