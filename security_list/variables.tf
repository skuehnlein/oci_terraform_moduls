variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "compartment_name" {
    description = "Name of the compartment in which the resource will be created"
    type = string
}

variable "vnc_OCID" {
    description = "The OCID of the VCN in which the resource will be created"
    type = string
}

variable "ingress_rules" {
    description = "List of all ingress rules of the security list"
    type list(object({
        protocol = string
        source =  string

    }))
}

variable "engress_rules" {
    description = "List of all engress rules of the security list"
    type list(object({
        protocol = string
        source = string

    }))
