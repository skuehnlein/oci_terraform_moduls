variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "compartment_name" {
    description = "Name of the compartment in which the resource will be created"
    type = string
}

variable "availability_domain" {
    description = "The availability domain in which the instance will be created"
    type = string
}

variable "instance_shape" {
    description = "The shape which will be used for the instance"
    type = string
}

variable "vnic_details" {
    description = "This veriable specifies the details for the primary VNIC which will be automatically created and attached when the instance is launched"
    type = object({
        subnet_OCID = string,
        assign_public_id = bool,
        hostname_label = string,
        private_ip = string
    })
}

variable "instance_launch_options" {
    description = "This variable contains all parameter which change the behavoir of the instance"
    type = object({
        boot_volume_type = string,
        firmware = string,
        is_consistent_volume_naming_enabled = string,
        is_pv_encryption_in_transit_enabled = string,
        network_type = string,
        remote_data_volume_type = string
    })
    default = null
}

variable "backup_boot_volume" {
    description  = "Flag to indicate whether a backup should be created or not"
    type = bool
    default = false
}

variable "backup_type" {
    decription = "The type of the backup which should be created. The value can be 'FULL' or 'INCREMENTAL'"
    type = string
}