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

resource "oci_core_route_table" "route_table" {
    #Required
    vcn_id = var.vcn_OCID
    compartment_id = lookup(local.compartment_ids,var.compartment_name)

    #Optional
    display_name = var.route_table_display_name

    dynamic "route_rules" {
        for_each = var.route_rules

        content {
            # Required
            network_entity_id = route_rules.value["network_entity_id"]

            #Optional
            description = route_rules.value["description"]
            destination = route_rules.value["destination"]
            destination_type = route_rules.value["destination_type"]
        }
    }

}