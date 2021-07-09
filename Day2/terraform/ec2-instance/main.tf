provider "aws" {
	region		= "us-east-1"
	access_key	= ""
	secret_key	= ""
}

resource "aws_instance" "ubuntu1" {
	ami = "ami-09e67e426f25ce0d7"
	instance_type = "t2.micro"
}
