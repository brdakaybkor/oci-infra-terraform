terraform {
  required_version = ">= 1.5.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.43.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "network" {
  source = "./modules/vcn"

  compartment_ocid = var.compartment_ocid
  vcn_cidr         = "10.0.0.0/16"
}

module "compute" {
  source = "./modules/compute"

  compartment_ocid = var.compartment_ocid
  subnet_id        = module.network.public_subnet_id
  instance_count   = 2
}
