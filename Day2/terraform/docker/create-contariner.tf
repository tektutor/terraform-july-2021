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
