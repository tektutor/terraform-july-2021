resource "aws_launch_template" "lt" {
	name_prefix = "tektutor-jegan"
	image_id    = "ami-09e67e426f25ce0d7"
	instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
	availability_zones = ["us-east-1a"]
	desired_capacity  = 2
	max_size 	  = 3
	min_size	  = 2

	launch_template {
		id = aws_launch_template.lt.id
		version = "$Latest"
	}
}
