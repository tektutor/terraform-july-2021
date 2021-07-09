variable "vpc-id" {
   default = "vpc-064fb12d81fc8b1a8"
}

data "aws_vpc" "existing-vpc" {
    id = var.vpc-id
}

resource "aws_vpc" "existing-vpc" {
	cidr_block = data.aws_vpc.existing-vpc.cidr_block
	
	tags = data.aws_vpc.existing-vpc.tags

	depends_on = [
		data.aws_vpc.existing-vpc
	]
}

resource "aws_subnet" "new-subnet" {

	vpc_id = data.aws_vpc.existing-vpc.id

	cidr_block = "172.31.2.0/24"

        tags = {
		Name = "NewSubnetOnExistingVPC"
	}
}


