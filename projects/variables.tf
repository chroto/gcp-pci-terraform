# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "billing_account" {
  description = "The ID of the associated billing account (optional)."
  default     = ""
}

variable "org_id" {
  description = "The ID of the Google Cloud Organization."
  default     = ""
}

variable "project_factory_source" {
  description = "Source path of the Project Factory module to use."
  default     = "terraform-google-modules/project-factory/google"
}

variable "project_factory_version" {
  description = "Version of the Project Factory module to use."
  default     = "1.0.2"
}

variable "project_prefix" {
  description = "Segment to prefix all project names with."
  default     = "gcp-pci-demo"
}

variable "region" {
  default = "us-central1"
}
