terraform {
  required_version = ">= 0.12.24"

#  backend "s3" {}

  required_providers {
        oci = "~> 3.75"
    }
}

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

    for_each = var.compartments

    # Required
    compartment_id = var.is_top_level_compartemt ? var.tenancy_OCID : lookup(local.compartment_ids,each.value["root_compartment"])
    description = each.value["compartment_description"]
    name = each.value["compartment_name"]
}
