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

resource "oci_identity_compartment" "compartment" {

    #for_each = var.compartments
    count = length(var.compartments)
    # Required
    compartment_id = var.is_top_level_compartemt ? var.tenancy_OCID : lookup(local.compartment_ids,var.compartments[count.index].root_compartment)
    description = var.compartments[count.index].compartment_description
    name = var.compartments[count.index].compartment_name
}
