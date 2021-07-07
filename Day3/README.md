### Terraform Overview
```
- Terraform is a Infrastructure as a Code(IAC) Tool
- Developed by HashiCorp as an Open source project
- Could be used to automate all known Cloud Infrastructures and Local VMs, Docker, Kubernetes, etc
- Terraform uses a declarative language called HCL (Hashicorp Configuration Language)
- The extension of terraform configuration files is .tf
- Though terraform configuration files can be names are user-defined, as a industry best practice main.tf is recommended

- Providers
    - Third-party Platforms that supports API
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
