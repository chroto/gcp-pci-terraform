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

provider "google" {
  region = "${var.region}"
}

locals {
  project_in_scope_cde  = "${var.project_prefix}-in-scope-cde"
  project_forseti       = "${var.project_prefix}-forseti"
  project_logging       = "${var.project_prefix}-logging"
  project_mgmt_shared   = "${var.project_prefix}-mgmt-shared"
  project_nonpci_shared = "${var.project_prefix}-nonpci-shared"
  project_out_of_scope  = "${var.project_prefix}-out-of-scope"
  project_pci_shared    = "${var.project_prefix}-pci-shared"
}

module "project_in_scope_cde" {
  source  = "${var.project_factory_source}"
  version = "${var.project_factory_version}"

  name            = "${local.project_in_scope_cde}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"

  activate_apis = [
    "compute.googleapis.com",
    "dlp.googleapis.com",
    "oslogin.googleapis.com",
    "sql-component.googleapis.com",
    "sqladmin.googleapis.com",
  ]
}

module "project_forseti" {
  source  = "${var.project_factory_source}"
  version = "${var.project_factory_version}"

  name            = "${local.project_forseti}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"

  activate_apis = [
    "admin.googleapis.com",
    "bigquery-json.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "deploymentmanager.googleapis.com",
    "iam.googleapis.com",
    "oslogin.googleapis.com",
    "servicemanagement.googleapis.com",
    "sql-component.googleapis.com",
    "sqladmin.googleapis.com",
  ]
}

module "project_logging" {
  source  = "${var.project_factory_source}"
  version = "${var.project_factory_version}"

  name            = "${local.project_logging}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"

  activate_apis = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
  ]
}

module "project_mgmt_shared" {
  source  = "${var.project_factory_source}"
  version = "${var.project_factory_version}"

  name            = "${local.project_logging}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"

  activate_apis = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
  ]
}

module "project_nonpci_shared" {
  source  = "${var.project_factory_source}"
  version = "${var.project_factory_version}"

  name            = "${local.project_nonpci_shared}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"

  activate_apis = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
  ]
}

module "project_out_of_scope" {
  source  = "${var.project_factory_source}"
  version = "${var.project_factory_version}"

  name            = "${local.project_out_of_scope}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"

  activate_apis = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "sqladmin.googleapis.com",
    "sql-component.googleapis.com",
  ]
}

module "project_pci_shared" {
  source  = "${var.project_factory_source}"
  version = "${var.project_factory_version}"

  name            = "${local.project_pci_shared}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"

  activate_apis = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
  ]
}
