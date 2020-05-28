resource "oci_identity_user_group_membership" "membership" {
    for_each = var.iam_users_group_membership

    user_id = lookup(iam_users,iam_groups,each.value[user_name])
    group_id  = lookup(iam_groups,iam_groups,each.value[group_name])
}