resource "oci_core_vcn" "main" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "demo-vcn"
}

resource "oci_core_subnet" "public" {
  cidr_block        = "10.0.1.0/24"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.main.id
  display_name      = "public-subnet"
  prohibit_public_ip_on_vnic = false
}

output "public_subnet_id" {
  value = oci_core_subnet.public.id
}
