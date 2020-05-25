# Creates the VCN
resource "oci_core_vcn" "vcn" {
    # Required
    cidr_block = var.vcn_cidr
    comparment_id = var.comparment_id

    # Optional
    display_name = var.vcn_display_name
    dns_label = var.vcn_dns_label

}

# Creates a NAT-Gateway if requested
resource "oci_core_nat_gateway" "nat_gateway" {
    count = var.create_nat_gateway == true ? 1 : 0
    
    # Requried
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id

    # Optional
    display_name = var.nat_gateway_display_name
}



# Create a Service Gateway if requested




