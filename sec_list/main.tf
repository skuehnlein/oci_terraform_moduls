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

resource "oci_core_security_list" "security_lists" {

    # Required
    compartment_id = lookup(local.compartment_ids,var.compartment_name)
    vcn_id = var.vcn_OCID
    
    #Optional
    display_name = var.display_name
    
    for ingress in var.ingress_rules {
        destination = ingress.destination
        protocol =  ingress.protocol

    }

    for engress in var.engress_rules {
        destination = engress.destination
        protocol =  engress.protocol
    }
}