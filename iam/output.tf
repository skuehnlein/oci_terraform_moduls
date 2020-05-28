output "iam_users" {
    description = "created users in the tenancy"
    value = join(",",oci_identity_user.users.*.name)
  
}

output "iam_groups" {
    description = "created groups in the tenancy"
    value = oci_identity_group.groups
}