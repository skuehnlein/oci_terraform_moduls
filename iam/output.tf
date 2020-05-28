output "iam_users" {
    description = "created users in the tenancy"
    value = {
        for user in oci_identity_user.users:
        user.name => user.id
    }
}

output "iam_groups" {
    description = "created groups in the tenancy"
    value = join(", ", oci_identity_user.*.group.name)
    
#    value = {
#        for user in oci_identity_user.users:
#        user.name => user.id
#    }
}