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
    display_name = var.security_list_display_name
    
    dynamic "egress_security_rules" {
        for_each = var.egress_rules
        content {
            destination = egress_security_rules.value["destination"]
            protocol =  egress_security_rules.value["protocol"]
        }
    }

    dynamic "tcp_ingress_security_rules" {
        for_each = var.tcp_ingress_rules
        content {
            source = tcp_ingress_security_rules.value["source"]
            protocol =  "6"
        }
    }

    dynamic "icmp_ingress_security_rules" {
        for_each = var.icmp_ingress_rules
        content {
            source = icmp_ingress_security_rules.value["source"]
            protocol =  "1"
        }
    }

    dynamic "udp_ingress_security_rules" {
        for_each = var.udp_ingress_rules
        content {
            source = udp_ingress_security_rules.value["source"]
            protocol =  "1""
        }
    }

}