output "security_list_OCID" {
    description = "The OCID of the created Security Lists"
    value = oci_core_security_list.security_list.id
}
