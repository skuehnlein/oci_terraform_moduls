variable "iam_users" {
    description = "The definition of the users which should be cretated"
    type = map(object(
    {
        user_name = string
        user_email = string
    }))
}

variable "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}
