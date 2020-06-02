
data "oci_identity_compartments" "compartments" {
    # Required
    compartment_id = var.tenancy_OCID

    # Optional
    access_level = "ACCESSIBLE"
    compartment_id_in_subtree = true
}

locals {
    compartment_ids = zipmap(data.oci_identity_compartments.compartments.compartments[*].name, data.oci_identity_compartments.compartments.compartments[*].id)
}


# Creates the VCN
resource "oci_core_vcn" "vcn" {
    # Required
    cidr_block = var.vcn_cidr
    compartment_id = lookup(local.compartment_ids,var.compartment_name)

    # Optional
    display_name = var.vcn_display_name
    dns_label = var.vcn_dns_label
}

