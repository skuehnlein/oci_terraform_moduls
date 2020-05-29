# general parameters
variable "tenancy_OCID" {
    description = "OCID of the tenancy"
    type = string
}

variable "compartments" {
    description = "Created Compartments"
    value = zipmap(values(oci_identity_compartments.compartments)[*].name,values(oci_identity_compartments.compartments)[*].id)
}
