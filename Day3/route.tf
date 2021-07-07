resource "aws_route_table" "jegan_route_table" {
	vpc_id = aws_vpc.jegan_vpc.id

	tags = {
		Name = "jegan_route_table"
	}
}

resource "aws_route_table_association" "jegan_route_table_association" {
	subnet_id = aws_subnet.jegan_subnet_1.id
	route_table_id = aws_route_table.jegan_route_table.id
}
