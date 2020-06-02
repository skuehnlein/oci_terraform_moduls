
# Creates the VCN
resource "oci_core_vcn" "vcn" {
    # Required
    cidr_block = var.vcn_cidr
    compartment_id = lookup(local.compartment_ids,var.compartment_name)

    # Optional
    display_name = var.vcn_display_name
    dns_label = var.vcn_dns_label
}

