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
variable "project_name" { default = "my-project" }
variable "org_id" { default = "" }
variable "billing_account" { default = "" }
variable "services" {
  default = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
  ]
}

resource "random_id" "id" {
  byte_length = 4
}

resource "google_project" "my_project" {
  name            = "${var.project_name}"
  project_id      = "${var.project_name}-${random_id.id.hex}"
  billing_account = "${var.billing_account}"
  org_id          = "${var.org_id}"
}

resource "google_project_services" "services" {
  project = "${google_project.my_project.project_id}"
  services = "${var.services}"
}

output "project_id" {
  value = "${google_project.my_project.project_id}"
}