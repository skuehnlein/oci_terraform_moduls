variable "iam_users" {
    description = "The definition of the users which should be cretated"
    type = list(object(
    {
        user_name = string
        user_email = string
    }))
}

variabel "tenancy_OCID" {
    description = "The OCID of the tenancy"
    type = string
}
