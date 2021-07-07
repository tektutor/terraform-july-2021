### Terraform Overview
```
- Terraform is a Infrastructure as a Code(IAC) Tool
- Developed by HashiCorp as an Open source project
- Could be used to automate all known Cloud Infrastructures and Local VMs, Docker, Kubernetes, etc
- Terraform uses a declarative language called HCL (Hashicorp Configuration Language)
- The extension of terraform configuration files is .tf
- Though terraform configuration files can be names are user-defined, as a industry best practice main.tf is recommended

- Providers
    - Terraform Plugins that helps Terraform to interact with external third-party Platforms that supports API
    - AWS, Azure, GCP, DataDog, Grafana, MySQL, MongoDB, etc.,
    
- Supports several 100s of Providers

- Terraform Providers are of 3 types
  1. Official ( e.g AWS, GCP, Azure )
  2. Verified and
  3. Community
  
- Terraform uses .tfstate file to store the current status of the infrastructure resources managed by Terraform
- Terraform state is the blueprint of the infrastructure resources managed by Terraform
- Terraform Cloud and Terraform Enterprise 
	- offers useful features to work as a Team
	
- Other types of IAC Tools

    - Configuration Management Tools
	- Ansible
	- Chef
	- Puppet
	- SaltStack

    - Server Templating Tools
	- Docker
	- HashiCorp Vagrant
	- HashiCorp Packer

    - Provisioning Tools
	- Terraform
	- Cloudformation

Configuration Management Tools (Ansible, Puppet, Chef & SaltStack)
  - Commonly used to install and manage softwares on existing infrastructure
  - Idempotent

Server Templating Tools
  - bundles required softwares with Container, Virtual Machines, etc.,
  - Promotes Immutable Infrastructure

Provisioning Tools
  - used to provision infrastructure like VM, Databases, VPC, Subnets, etc
  - Cloudformation is tool that provisions infrastructue in Amazon AWS
  - Terraform is cloud independent provisioning tool
  - Terraform supports private and public cloud
```

### Sample Terraform Configuration Script

You may create a file create-docker-container.tf with below contents

```
terraform {
  required_providers {
	docker = {
		source  = "kreuzwerker/docker"
		version = "2.13.0"
	}
  }
}

provider "docker" {
   host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
	name = "nginx:latest"
}

resource "docker_container" "nginx1" {
	image = docker_image.nginx.latest
	name = "nginx1_container"
}
```

### Install provider plugins
```
terraform init
```

### Verify the plan before you apply the changes before you provision
```
terraform plan
```

### Provision the infrastructure
```
terraform apply
```

### Refresh the terraform state
```
terraform refresh
```

### Display the current status of resources managed by terraform
```
terraform show
```

### Terraform Variables
```
variable "ubuntu_ami" {
   default = "ami-aabbccdd343242424"
}

variable "instance_type" {
   default = "t2.micro"
}

resource "aws_instance" "ubuntu1" {
   ami = var.ubuntu_ami
   instance_type = var.instance_type 
}
``` 

### Terraform List Variables
```
variable "text_editors" {
   type = list
   default = [ "vim", "sublime-text", "visual-studio-code", "atom" ]
}
```
List elements can be accessed as below
```
var.text_editors[0]
var.text_editors[1]
var.text_editors[2]
```

### Terraform Map variable
```
variable software_paths {
   type = map
   default = {
     "jdk_home" = "/usr/lib/java/jdk11"
     "m2_home"  = "/usr/share/maven"
   }
}
```

Map elements can be accessed as shown below
```
var.software_paths["jdk_home"]
var.software_paths["m2_home"]
```

### List of string
```
variable "softwares" {
    type = list(string)
    default = [ "ansble", "terraform", "docker" ]
}
In case the variable value is not of type string then Terraform will report errors.
```

### List of number
```
variable "cpu_cores" {
   type = list(number)
   default = ["2", "4", "8"]
}
```

### Object variable
```
variable "vm_configuration" {
   type = object( {
      name_of_vm = string
      ram_in_gb  = string
      cpu_cores = number
      storage_in_gb = string
      is_ssd = bool
   })

   default = {
      name_of_vm = "ubuntu1"
      ram_in_gb = "128 GB"
      cpu_cores = 48
      storage_in_gb = "1 TB"
      is_ssd = true
   }
}
```

### Tuple - elements of different types 
```
variable "vm_configuration" {
   type = tuple ( [string, string, number, string, bool ] )
   default = [ "ubuntu1", "128 GB", 48, "1 TB", true ]
}
```
