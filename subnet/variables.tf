variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "compartment_name" {
    description = "Name of the compartment in which the resource will be created"
    type = string
}

variable "vcn_OCID" {
    description = "The OCID of the VCN in which the resource will be created"
    type = string
}

variable "subnet_cidr_block" {
    description = "The CIDR Block for the subnet"
    type = string
}

variable "availability_domain" {
    description = "The availability domain in which the AD-specific subnet will be created"
    type = string
    default = ""
}

variable "subnet_display_name" {
    description = "The name of the subent which will be shown in the OCI console"
    type = string
}

variable "subnet_dns_label" {
    description = "The DNS label for the subnet, used in conjunction with the VNIC's hostname and VCN's DNS label"
    type = string
    default = ""
}

variable "is_private_subnet" {
    description = "Flag that indicates whether the subnet is a private or a public subnet"
    type = bool
    default = false
}

variable "route_table_OCID" {
    description = "The OCID of the route table which will be assigned to the subnet"
    type = string
}

variable "security_list_OCIDs" {
    description = "The list of OCIDs of the security lists which will be assigend to the subnet"
    type = list(string)
}