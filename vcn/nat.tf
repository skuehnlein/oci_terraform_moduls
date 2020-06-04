# Creates a NAT-Gateway if requested
resource "oci_core_nat_gateway" "nat_gateway" {
    count = var.create_nat_gateway == true ? 1 : 0
    
    # Requried
    compartment_id = lookup(local.compartment_ids,var.compartment_name)
    vcn_id = oci_core_vcn.vcn.id

    # Optional
    display_name = var.nat_gateway_display_name
}


