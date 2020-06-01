variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "compartments" {
    description = "The definition of the compartments which should be cretated"
    type = list(object( {
        root_compartment = string,
        compartment_name = string,
        compartment_description = string
    }))
}

variable "is_top_level_compartemt" {
    description = "Flag that indicats, that the compartment should be created als child of the root compartment"
    type = bool
    default = true
}

variable "all_compartment_policies" {
    description = "The definition of all policies which should be created"
    type = map(object({
        name = string,
        compartment_name = string,
        description = string,
        statement = list(string)
    }))
}