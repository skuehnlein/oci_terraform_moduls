variable "created_compartments" {
    description = "Created Compartments"
    value = zipmap(values(oci_identity_compartment.compartment)[*].name,values(oci_identity_compartment.compartment)[*].id)
}
