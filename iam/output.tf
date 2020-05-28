output "iam_users" {
    description = "created users in the tenancy"
    value = zipmap(oci_identity_user.users.*.name,oci_identity_user.users.*.id)
  
}

output "iam_groups" {
    description = "created groups in the tenancy"
    value = zipmap(oci_identity_group.groups.*.name,oci_identity_group.groups.*.id)
}