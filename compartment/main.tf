terraform {
  required_version = ">= 0.12.24"

  backend "s3" {}

  required_providers {
        oci = "~> 3.75"
    }
}

data "oci_identity_compartments" "all_compartments" {
    # Required
    compartment_id = var.tenancy_OCID

    # Optional
    access_level = "ACCESSIBLE"
    compartment_id_in_subtree = true
}

resource "oci_identity_compartment" "compartment" {

    for_each = var.compartments

    # Required
    compartment_id = lookup(zipmap(values(data.oci_identity_compartments.all_compartments)[*].name, values(data.oci_identity_compartments.all_compartments)[*].id),each.value["root_compartment"])
    description = each.value["compartment_description"]
    name = each.value["compartment_name"]
}
