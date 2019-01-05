module "pci-shared-vpc-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "pci-shared-vpc"
}

module "pci-xpc-host" {
  source          = "./modules/network/xpc/host"
  host_project    = "${module.pci-shared-vpc-project.project_id}"
}

module "nonpci-shared-vpc-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "nonpci-shared-vpc"
}

module "nonpci-xpc-host" {
  source          = "./modules/network/xpc/host"
  host_project    = "${module.nonpci-shared-vpc-project.project_id}"
}

module "in-scope-gstock-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "in-scope-gstock"
  services        = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "dlp.googleapis.com",
    "sqladmin.googleapis.com",
    "sql-component.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudbuild.googleapis.com"
    "datastore.googleapis.com"
  ]
}

module "in-scope-gstock-vpc" {
  source          = "./modules/network/xpc/service"
  host_project    = "${module.pci-shared-vpc-project.project_id}"
  service_project = "${module.in-scope-gstock-project.project_id}"
}

module "out-scope-gstock-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "out-scope-gstock"
  services        = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudbuild.googleapis.com",
  ]
}

module "out-scope-gstock-vpc" {
  source          = "./modules/network/xpc/service"
  host_project    = "${module.nonpci-shared-vpc-project.project_id}"
  service_project = "${module.out-scope-gstock-project.project_id}"
}

module "mgmt-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "mgmt"
}

module "mgmt-vpc" {
  source          = "./modules/network/xpc/service"
  host_project    = "${module.mgmt-shared-vpc-project.project_id}"
  service_project = "${module.out-scope-gstock-project.project_id}"
}

module "logging-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "logging"
  services        = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com"
  ]
}
