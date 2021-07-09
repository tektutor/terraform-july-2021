resource "aws_ebs_volume" "ebs_vol" {
	availability_zone = "us-east-1a"
	size = 1
}

resource "aws_volume_attachment" "ebs_attach" {
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.ebs_vol.id
	instance_id = aws_instance.ubuntu1.id
}

resource "aws_instance" "ubuntu1" {
	ami = ""
	instance_type = "t2.micro"
	availability_zone = "us-east-1a"

	tags = {
		Name = "ubuntu1"
	}
}

