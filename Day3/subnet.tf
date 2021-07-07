resource "aws_subnet" "jegan_subnet_1" {
	vpc_id = aws_vpc.jegan_vpc.id 
	cidr_block = "192.168.1.0/24"

	tags = {
		Name = "jegan_subnet_1"
	}
}
