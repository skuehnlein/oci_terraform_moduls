# general parameters
variable "compartment_name" {
    description = "Name of the Compartment to which the VCN will be assigend"
    type        = string
}

variable "tenancy_OCID" {
    description = "The OCID of the tenant"
    type        = string
}

# VCN Parameters
variable "vcn_cidr" {
    description = "CIDR block of the VCN"
    type        = string
}

variable "vcn_display_name" {
    description = "Name for the VCN"
    type        = string
}

variable "vcn_dns_label" {
    description = "A DNS label for the VCN, used in conjunction "
    type        = string
}

# NAT Gateway Parameters
variable "create_nat_gateway" {
    description = "Flag, whether to create a nat gateway in the VCN"
    type        = bool
    default     = false
}

variable "nat_gateway_display_name" {
    description = "Name for the NAT Gateway"
    type        = string
}

# Internet Gateway Parameters
variable "create_internet_gateway" {
    description = "Flag, whether to create a internet gateway in the VCN"
    type        = bool
    default     = false
}

variable "intenet_gateway_display_name" {
    description = "Name for the Internet Gateway"
    type        = string
}

variable "create_service_gateway" {
    description = "Flag, whether to create a service gateway in the VCN"
    type        = bool
    default     = false
}

variable "service_gateway_display_name" {
    description = "Name for the Service Gateway"
    type        = string
}


variable "create_dynamic_routing_gateway" {
    description = "Flag, whether to create a service gateway in the VCN"
    type        = bool
    default     = false
}

variable "drg_display_name" {
    description = "Name for the Dynamic Routing Gateway"
    type        = string
}
