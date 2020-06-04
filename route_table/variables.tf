variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "compartment_name" {
    description = "Name of the compartment in which the resource will be created"
    type = string
}

variable "route_table_display_name" {
    description = "The name of the route table which will be shown in the OCI console"
    type = string
    default = null
}

variable "vcn_OCID" {
    description = "The OCID of the vcn"
    type = string
}


variable "route_rules" {
    description = "Route Rules for the route table"
    type = list(object({
        network_entity_id = string,
        description = string,
        destination = string,
        destination_type = string
    }))
} 