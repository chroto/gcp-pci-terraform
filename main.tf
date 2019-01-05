module "pci-shared-vpc-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "pci-shared-vpc"
}

module "nonpci-shared-vpc-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "nonpci-shared-vpc"
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

module "out-scope-gstock-project" {
  source          = "./modules/project"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account}"
  project_name    = "out-scope-gstock"
  services        = [
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudbuild.googleapis.com"
}
