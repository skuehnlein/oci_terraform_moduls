# general parameters
variable "compartments" {
    description = "Created Compartments"
    value = zipmap(values(oci_identity_compartments.compartments)[*].name,values(oci_identity_compartments.compartments)[*].id)
}
