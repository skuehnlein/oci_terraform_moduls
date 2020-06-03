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


resource "oci_core_subnet" "subnet" {
    # Required
    cidr_block = var.subnet_cidr_block
    compartment_id = lookup(local.compartment_ids,var.compartment_name)
    vcn_id = var.vcn_OCID
    cidr_block = var.subnet_cidr_block

    #Optional
    availability_domain = var.availability_domain
    display_name = var.subnet_display_name
    dns_label = var.subnet_dns_label
    prohibit_public_ip_on_vnic = var.is_private_subnet
    route_table_id = var.route_table_OCID
    security_lists_ids = var.security_list_OCIDs

}
