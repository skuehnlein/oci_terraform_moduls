variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}

variable "iam_users" {
    description = "The definition of the users which should be cretated"
    type = map(object( {
        user_name = string,
        user_email = string
    }))
}

variable "iam_groups" {
    description = "The definition of the groups which should be created"
    type = map(object( {
        group_name = string,
        group_description = string
    }))
}

variable "iam_users_group_membership" {
    description = "The mapping between the users and the groups"
    type = map(list(string))
    default = []
    #type = map(object( {
    #    user_name = string,
    #    group_name =  string
    #}))
}


