# https://developer.hashicorp.com/terraform/tutorials/docker-get-started/docker-build
# https://developer.hashicorp.com/terraform/language/providers
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name          = "nginx:latest"
  keep_locally  = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
