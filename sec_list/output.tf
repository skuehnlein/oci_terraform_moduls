output "security_list_OCID" {
    description = "The created security lists"
    value = oci_core_security_list.security_list.id
}
