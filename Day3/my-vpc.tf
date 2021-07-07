resource "aws_vpc" "jegan_vpc" {
	cidr_block = "192.168.0.0/16"

	tags = {
		Name = "jegan_vpc"
	}
}
