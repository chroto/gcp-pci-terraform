variable "service_project" { default = "" }
variable "host_project" { default = "" }

#enable a service project to use a shared vpc
resource "google_compute_shared_vpc_service_project" "my_shared_vpc" {
  host_project    = "${var.host_project}"
  service_project = "${var.service_project}"
}
