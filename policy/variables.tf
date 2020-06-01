variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "compartment_policies" {
    description = "The definition of all policies which should be created"
    type = map(object({
        name = string,
        compartment_name = string,
        description = string,
        statements = list(string)
    }))
}