output "iam_users" {
    description = "created users in the tenancy"
    value = {
        for user in oci_identity_user.users:
        user.name => user.id
    }
    
}
