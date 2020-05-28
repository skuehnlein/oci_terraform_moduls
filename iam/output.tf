output "iam_users" {
    description = "created users in the tenancy"
#    value = zipmap(values(oci_identity_user.users)[*].name,values(oci_identity_user.users)[*].id)
    value = {
        for user in oci_identity_user.users:
        user.name => user.id
    }
}

output "iam_groups" {
    description = "created groups in the tenancy"
#    value = zipmap(values(oci_identity_group.groups)[*].name,values(oci_identity_groups.groups)[*].id)
    value = {
        for group in oci_identity_group.groups:
        group.name => group.id
    }
}