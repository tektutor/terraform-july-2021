provider "aws" {
	region 		= "us-east-1"
	access_key	= "your-access-key"
	secret_key	= "your-secret-key"
}

locals {
	vpc_id 		= aws_vpc.tektutor_vpc.id
	subnet_id	= aws_subnet.tektutor_subnet_1.id
	ssh_user	= "ubuntu"
	key_name	= "terraform"
	private_key_path= "~/Downloads/terraform.pem"
}

resource "aws_vpc" "tektutor_vpc" {
	cidr_block = "192.168.0.0/16"
  	enable_dns_hostnames = true
  	enable_dns_support = true
	
	tags = {
		Name = "tektutor_vpc"
	}
}

resource "aws_security_group" "tektutor_security_group" {
  name        = "allow_web"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.tektutor_vpc.id

  ingress {
    description      = "https incoming requests"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "http incoming requests"
    from_port        = 80 
    to_port          = 80 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "All ICMP"
    from_port        = -1 
    to_port          = -1 
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22 
    to_port          = 22 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

resource "aws_internet_gateway" "tektutor_internet_gateway" {
	vpc_id = aws_vpc.tektutor_vpc.id
	tags = {
		Name = "tektutor_internet_gateway"
	}
}

resource "aws_route_table" "tektutor_route_table" {
	vpc_id = aws_vpc.tektutor_vpc.id
	
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.tektutor_internet_gateway.id
	}

	tags = {
		Name = "tektutor_route_table"
	}
}

resource "aws_route_table_association" "tektutor_route_table_association" {
	subnet_id = aws_subnet.tektutor_subnet_1.id
	route_table_id = aws_route_table.tektutor_route_table.id
}

resource "aws_subnet" "tektutor_subnet_1" {
	vpc_id = aws_vpc.tektutor_vpc.id
	cidr_block = "192.168.1.0/24"
  	availability_zone = "us-east-1a"
  	map_public_ip_on_launch = "true"

	tags = {
		Name = "tektutor_subnet_1"
	}
}

resource "aws_network_interface" "tektutor_nic" {
	subnet_id  = aws_subnet.tektutor_subnet_1.id
	private_ips = ["192.168.1.100"] 

        security_groups = [aws_security_group.tektutor_security_group.id]	
	tags = {
		Name = "Primary Network Interface"
	}
}

resource "aws_instance" "ubuntu1" {
	ami = "ami-09e67e426f25ce0d7"
	instance_type = "t2.micro"
	key_name = "terraform"
	
	network_interface {
    		network_interface_id = aws_network_interface.tektutor_nic.id
    		device_index         = 0
  	}

	//user_data = file("install_apache.sh")

        provisioner "remote-exec" {
		inline = ["echo 'Waiting for ec2 for it is getting booted'"]
	    connection {
		type = "ssh"
		user = "${local.ssh_user}"
		private_key = file(local.private_key_path)
		host = aws_instance.ubuntu1.public_ip
	    }
        }

	provisioner "local-exec" {
		command = "ansible-playbook -i ${aws_instance.ubuntu1.public_ip}, --private-key ${local.private_key_path} install-tmux-playbook.yml" 
	}

	tags = {
		Name = "ubuntu1"
	}
}

