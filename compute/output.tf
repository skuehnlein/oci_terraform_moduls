output "compute_instance_OCID" {
    description = "The OCID of the created compute instance"
    value = oci_core_instance.compute_instance.id
}

output "boot_volume_OCID" {
    description = "The OCID of the boot volume which is assigned to the compute intance"
    value = oci_core_instance.compute_instance.boot_volume_id
}