variable "host_project" { default = "" }

# Enable shared VPC hosting in the host project.
resource "google_compute_shared_vpc_host_project" "pci_shared" {
  project    = "${var.host_project}"
}
