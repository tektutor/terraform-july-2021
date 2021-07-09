# Terraform Functions

### Terraform console
```
terraform console
```

### Terraform function
```
resource "aws_iam_policy" "tektutorAdminUser" {
   name 	= "tektutor"
   policy 	= file("tektutor-admin-policy.json")
}

resource "local_file" "file" {
   filename = var.filename
   count    = length(var.filename)
}
```

### Converting Terraform List to Set
```
variable region {
   type     	= list
   description	= "List of AWS Regions"
   default  	= [ "us-east-1", "us-west-1", "ap-south-1" ]
}

resource "local_file "regions" {
   filename = var.filename
   for_each = toset(var.region)
}
```

### Practicing Terraform functions in console
```
terraform console
max ( 10, -300, 15, 850, -900 )
min ( 0, -18, 240, 534, -63 )
ceil (10.1)
ceil (10.9)
floor(10.9)
split( ",", "ami-123, AMI-xyz, ami-pqr" )
lower(var.ami)
upper(var.ami)
title(var.ami)
substr(var.ami, 0, 5)
substr(var.ami, 8, 3)
length(var.ami)
index(var.ami, "AMI-xyz")
element(var.ami, 3)
contains(var.ami, "AMI-xyz")
contains(var.ami, "AMI-PQR")
```

