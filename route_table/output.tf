output "route_table_OCID" {
    description = "The OCID of the created route table"
    value = oci_core_route_table.route_table.id
}
