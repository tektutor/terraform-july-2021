resource "aws_security_group" "jegan_security_group" {

	name		= "allow_web"
	description 	= "Allow web server traffic"
	vpc_id		= aws_vpc.jegan_vpc.id

	ingress {
		description      = "https incoming requests"
		
		from_port        = 443
		to_port	         = 443
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}
	ingress {
		description      = "http incoming requests"
		
		from_port        = 80 
		to_port	         = 80 
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	egress {
		from_port	 = 0
		to_port		 = 0
		protocol	 = "-1"
		cidr_blocks	 = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	tags = {
		Name = "allow_web"
	}

}
