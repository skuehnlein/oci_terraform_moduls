# Create a Dynamic Routing Gateway if requested
resource "oci_core_drg" "dynamic_routing_gateway" {
    count = var.create_dynamic_routing_gateway == true ? 1 : 0

    #Required
    compartment_id = var.compartment_id

    # Optional
    display_name = var.drg_display_name
}

resource "oci_core_route_table" "drg_route_table" {
    count = var.create_dynamic_routing_gateway == true ? 1 : 0

    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id

    #Optional
    display_name = "Route Table for the NAT Gateway"
    route_rules{
        # Required
        network_entity_id = oci_core_drg.dynamic_routing_gateway[0].id

        #Optionally
        destination = "0.0.0.0/0"
        destination_type = CIDR_BLOCK
    }
}

resource "oci_core_drg_attachment" "drg_attachment" {
    count = var.create_dynamic_routing_gateway == true ? 1 : 0

    #Required
    drg_id = oci_core_drg.dynamic_routing_gateway[0].id
    vcn_id = oci_core_vcn.vcn.id

    #Required
    display_name = "Attachment of the Dynamic Route Table to the VCN"
    route_table_id = oci_core_route_table.drg_route_table[0].id
}
