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
    all_compartment_ids = zipmap(data.oci_identity_compartments.compartments.compartments[*].name, data.oci_identity_compartments.compartments.compartments[*].id)
}

resource "oci_identity_policy" "compartment_policies" {
    for_each = var.compartment_policies

    #Required
    compartment_id = lookup(local.all_compartment_ids,each.value["compartment_name"])
    name = each.value["name"]
    description = each.value["description"]
    statements = each.value["statements"]
}