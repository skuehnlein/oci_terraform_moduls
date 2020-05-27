output "iam_users" {
    description = "created users in the tenancy"
    value = join(",", oci_identity_user.users.*.id)
}
