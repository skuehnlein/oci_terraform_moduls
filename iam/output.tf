output "iam_users" {
    description = "created users in the tenancy"
    value = zipmap(list(oci_identity_user.users.*.name), list(oci_identity_user.users.*.id))
  
}

output "iam_groups" {
    description = "created groups in the tenancy"
    value = zipmap(list(oci_identity_group.groups.*.name), list(oci_identity_group.groups.*.id))
}