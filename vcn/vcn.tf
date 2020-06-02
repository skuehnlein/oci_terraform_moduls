
data "oci_identity_compartments" "compartments" {
    # Required
    compartment_id = var.tenancy_OCID

    # Optional
    access_level = "ACCESSIBLE"
    compartment_id_in_subtree = true
}

data "null_data_source" "compartment_OCID" {
    inputs = {
        compartment_OCID = lookup(zipmap(values(oci_identity_compartments.compartments)[*].name,values(oci_identity_compartments.compartments)[*].id),var.Compartment_name)
    }
}

# Creates the VCN
resource "oci_core_vcn" "vcn" {
    # Required
    cidr_block = var.vcn_cidr
    compartment_id = data.null_data_source.values.outputs["compartment_OCID"].id

    # Optional
    display_name = var.vcn_display_name
    dns_label = var.vcn_dns_label
}

