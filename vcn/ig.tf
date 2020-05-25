# Create a Internet Gateway if requested
resource "oci_core_internet_gateway" "internet_gateway" {
    count = var.create_internet_gateway == true ? 1 : 0

    # Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id

    # Optional
    display_name = var.intenet_gateway_display_name
}

resource "oci_core_route_table" "route_table_internet_gateway" {
    count = var.create_internet_gateway == true ? 1 : 0

    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id

    #Optional
    display_name = "Route Table for the NAT Gateway"
    route_rules {
        # Required
        network_entity_id = oci_core_internet_gateway.internet_gateway[0].id

        #Optionally
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }

}
