variable "iam_users" {
    type = list(object({
        user_name = string
        user_email = string
    }))
}
