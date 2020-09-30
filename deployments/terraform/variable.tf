variable "deployment_image" {
  default = "docker.merycicek.com/hello-world-app-dev-feature:fe57059"
}
variable "deployment_environment" {
    default = "dev"
}

variable "deployment_endpoint" {
  type = "map"
  default = {
    test  = "test.hello"
    dev  = "dev.hello"
    qa   = "qa.hello"
    prod = "hello"
    stage = "stage.hello"
  }
}

variable "google_domain_name" {
  default = "merycicek.com"
}

output "application_endpoint" {
  value = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}