output "subnet_OCID" {
    description = "The OCID of the created subnet"
    value = oci_core_subnet.subnet.id
}