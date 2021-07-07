provider "aws" {
	region		= "us-east-1"
	access_key	= "AKIAYIMEDZZZHH4DBHGA"
	secret_key	= "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"
}


resource "aws_instance" "ubuntu1" {
	ami = "ami-09e67e426f25ce0d7"
	instance_type = "t2.micro"

	tags = {
		Name = "jegan-ubuntu1"
	}
}
