variable "host_project" { default = "" }
variable "subnet" { default = "" }
# Create the hosted network.
resource "google_compute_network" "shared_network" {
  name                    = "${var.name}-shared-network"
  auto_create_subnetworks = "false"
  project                 = "${var.host_project}"
}

resource "google_compute_subnetwork" "subnets" {
  name             = "${var.name}-mgmt-subnets"
  ip_cidr_range    = "${var.subnet}"
  region           = "${var.region}"
  network          = "${google_compute_network.shared_network.self_link}"
  project          = "${var.host_project}"
  enable_flow_logs = "true"
}
