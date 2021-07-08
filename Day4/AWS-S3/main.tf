provider "aws" {
    region 	= "us-east-1"
    access_key  = ""
    secret_key  = ""
}

resource "aws_s3_bucket" "tektutor" {
	bucket = "tektutor-trainings-2021"
	tags = {
		Description = "Training Calendar"
	}
}

resource "aws_s3_bucket_object" "training_calendar" {
	content = "./training-calendar.txt"
	key 	= "2021"
	bucket  = aws_s3_bucket.tektutor.id
}

data "aws_iam_group" "tektutor" {
    group_name = "OpsTeam"
}

resource "aws_s3_bucket_policy" "tektutor-policy" {
    bucket = aws_s3_bucket.tektutor.id
    policy = <<EOF

    {
	"Version": "2012-10-17",
	"Statement": [
	  {
		"Action": "*",
		"Effect": "Allow",
		"Resource": "arn:aws:s3:::${aws_s3_bucket.tektutor.id}/*",
		"Principal": {
			"AWS": [
				"${data.aws_iam_group.tektutor.arn}"
			]
		}
	  }
	]
    }
    EOF

}
