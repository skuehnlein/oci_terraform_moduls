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
        iterator = tcp_egress_iterator
        for_each = var.tcp_egress_rules

        content {
            description = tcp_egress_iterator.value["description"]
            destination = tcp_egress_iterator.value["destination"]
            destination_type = tcp_egress_iterator.value["destination_type"]
            protocol =  6
            stateless = tcp_egress_iterator.value["stateless"]
        
            dynamic "tcp_options" {
                for_each = tcp_egress_iterator.value["destination_port"] == -1 ? [] : list(1)

                content{
                    min = tcp_egress_iterator.value["destination_port"]
                    max = tcp_egress_iterator.value["destination_port"]
                }
            }
        }
    }

    dynamic "egress_security_rules" {
        iterator = icmp_egress_iterator
        for_each = var.icmp_egress_rules

        content {
            description = icmp_egress_iterator.value["description"]
            destination = icmp_egress_iterator.value["destination"]
            destination_type = icmp_egress_iterator.value["destination_type"]
            protocol =  1
            stateless = icmp_egress_iterator.value["stateless"]
        }
    }

    dynamic "egress_security_rules" {
        iterator = udp_egress_iterator
        for_each = var.udp_egress_rules

        content {
            description = udp_egress_iterator.value["description"]
            destination = udp_egress_iterator.value["destination"]
            destination_type = udp_egress_iterator.value["destination_type"]
            protocol =  17
            stateless = udp_egress_iterator.value["stateless"]
        

           dynamic "udp_options" {
                for_each = udp_egress_iterator.value["destination_port"] == -1 ? [] : list(1)

                content{
                    min = udp_egress_iterator.value["destination_port"]
                    max = udp_egress_iterator.value["destination_port"]
                }
            }
        }
    }

    dynamic "ingress_security_rules" {
        iterator = tcp_ingress_iterator
        for_each = var.tcp_ingress_rules

        content {
            description = tcp_ingress_iterator.value["description"]
            source = tcp_ingress_iterator.value["source"]
            source_type = tcp_ingress_iterator.value["source_type"]
            protocol =  6
            stateless = tcp_ingress_iterator.value["stateless"]
        
            dynamic "tcp_options" {
                for_each = tcp_ingress_iterator.value["destination_port"] == -1 ? [] : list[(1)

                content{
                    min = tcp_ingress_iterator.value["destination_port"]
                    max = tcp_ingress_iterator.value["destination_port"]
                }
            }
        }
    }

    dynamic "ingress_security_rules" {
        iterator = icmp_ingress_iterator
        for_each = var.icmp_ingress_rules
        content {
            description = icmp_ingress_iterator.value["description"]
            source = icmp_ingress_iterator.value["source"]
            source_type = icmp_ingress_iterator.value["source_type"]
            protocol =  1
            stateless = icmp_ingress_iterator.value["stateless"]
        }
    }

    dynamic "ingress_security_rules" {
        iterator = udp_ingress_iterator
        for_each = var.udp_ingress_rules

        content {
            description = udp_ingress_iterator.value["description"]
            source = udp_ingress_iterator.value["source"]
            source_type = udp_ingress_iterator.value["source_type"]
            protocol =  17
            stateless = udp_ingress_iterator.value["stateless"]

           dynamic "udp_options" {
                for_each = udp_ingress_iterator.value["destination_port"] == -1 ? [] : list(1)

                content{
                    min = udp_ingress_iterator.value["destination_port"]
                    max = udp_ingress_iterator.value["destination_port"]
                }
            }
        }
    }

}