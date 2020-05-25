# Create a Internet Gateway if requested
resource "oci_core_internet_gateway" "internet_gateway" {
    count = var.create_internet_gateway == true ? 1 : 0

    # Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id

    # Optional
    display_name = var.intenet_gateway_display_name
}