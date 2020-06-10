resource "oci_core_service_gateway" "service_gateway" {
    count = var.create_service_gateway == true ? 1 : 0

    # Required
    compartment_id = lookup(local.compartment_ids,var.compartment_name)
    vcn_id = oci_core_vcn.vcn.id

    display_name = var.display_name
    
    services {
        service_id = format ("All %s Services in Oracle Services Network", var.region)
    }
}