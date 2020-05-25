# Create a Dynamic Routing Gateway if requested
resource "oci_core_drg" "dynamic_routing_gateway" {
    count = var.create_dynamic_routing_gateway = true ? 1 : 0

    #Required
    compartment_id = var.compartment_id

    # Optional
    display_name = var.drg_gateway_display_name
  
}