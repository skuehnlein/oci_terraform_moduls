variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "compartments" {
    description = "The definition of the compartments which should be cretated"
    type = map(object( {
        root_compartment = string,
        compartment_name = string,
        compartment_description = string
    }))

variable "is_top_level_compartemt" {
    description = "Flag that indicats, that the compartment should be created als child of the root compartment"
    type = bool
    default = true

}