variable "vpc_id" { 
    default = "vpc-d6cbd1b1"
}

variable "subnet_id" { 
    default = "subnet-081d433bb715f2893"
}

data "aws_vpc" "source" {
  provider = aws.source
  id = var.vpc_id
}

data "aws_subnet" "source" {
  provider = aws.source
  id = var.subnet_id 
}

resource "aws_vpc" "dest" {
        provider = aws.dest
	cidr_block = data.aws_vpc.source.cidr_block

	tags = data.aws_vpc.source.tags
}

resource "aws_subnet" "dest" {
    provider = aws.dest

    vpc_id = aws_vpc.dest.id

    cidr_block = data.aws_subnet.source.cidr_block

    tags = data.aws_subnet.source.tags
}

output "vpc_name" {
	value = data.aws_vpc.source.tags
}

output "subnet_name" {
	value = data.aws_subnet.source.tags
}
