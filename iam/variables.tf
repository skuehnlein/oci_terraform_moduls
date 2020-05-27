variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "iam_users" {
    description = "The definition of the users which should be cretated"
    type = map(object( {
        user_name = string
        user_email = string
    }))
}

varaible "iam_groups" {
    description = "The definition of the groups which should be created"
    type = map(object( {
        group_name = string
        group_description = string
    }
}


