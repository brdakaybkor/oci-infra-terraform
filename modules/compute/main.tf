resource "oci_core_instance" "app" {
  count               = var.instance_count
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  display_name        = "app-instance-${count.index}"

  shape = "VM.Standard.E4.Flex"

  shape_config {
    ocpus = 1
    memory_in_gbs = 8
  }

  source_details {
    source_type = "image"
    image_id    = data.oci_core_images.oracle_linux.images[0].id
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = true
  }
}

data "oci_core_images" "oracle_linux" {
  compartment_id = var.compartment_ocid
  operating_system = "Oracle Linux"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

variable "compartment_ocid" { type = string }
variable "subnet_id" { type = string }
variable "instance_count" { type = number }
