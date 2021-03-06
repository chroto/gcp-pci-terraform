/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
# Create the hosted network.
resource "google_compute_network" "pci_shared_network" {
  name                    = "pci-shared-network"
  auto_create_subnetworks = "false"
  project                 = "${google_compute_shared_vpc_host_project.pci_shared.project}"
}

resource "google_compute_subnetwork" "pci_subnets" {
  name             = "pci-subnets"
  ip_cidr_range    = "10.2.0.0/20"
  region           = "${var.region}"
  network          = "${google_compute_network.pci_shared_network.self_link}"
  project          = "${google_compute_shared_vpc_host_project.pci_shared.project}"
  enable_flow_logs = "true"
}
