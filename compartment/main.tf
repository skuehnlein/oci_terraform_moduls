terraform {
  required_version = ">= 0.12.24"

#  backend "s3" {}

  required_providers {
        oci = "~> 3.75"
    }
}

data "oci_identity_compartments" "all_compartments" {
    # Required
    compartment_id = var.tenancy_OCID

    # Optional
    access_level = "ANY"
    compartment_id_in_subtree = true
}

output "oci_compartments" {
    value = data.oci_identity_compartments.all_compartments
}

resource "oci_identity_compartment" "test_compartment" {
    compartment_id = var.tenancy_OCID
    description = "test"
    name = "test"
}
resource "oci_identity_compartment" "compartment" {

    for_each = var.compartments

    # Required
    compartment_id = lookup(zipmap(values(oci_identity_compartment.all_compartments)[*].name, values(oci_identity_compartment.all_compartments)[*].id),each.value["root_compartment"])
    description = each.value["compartment_description"]
    name = each.value["compartment_name"]
}
