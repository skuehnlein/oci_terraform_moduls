data "oci_identity_users" "users" {
    # Required
    compartment_id = var.tenancy_OCID
      depends_on = [
    oci_identity_user.users,
  ]
}

data "oci_identity_groups" "groups" {
    # Required
    compartment_id = var.tenancy_OCID
      depends_on = [
    oci_identity_group.groups,
  ]
}

locals {
    group_ids = zipmap(data.oci_identity_groups.groups.groups[*].name, data.oci_identity_groups.groups.groups[*].id)
    user_ids = zipmap(data.oci_identity_users.users.users[*].name, data.oci_identity_users.users.users[*].id)
}

#Assigns the users to a group
resource "oci_identity_user_group_membership" "membership" {
    for_each = var.iam_users_group_membership

    # Required
    user_id = lookup(local.user_ids, each.value["user_name"])
    group_id  = lookup(local.group_ids, each.value["group_name"])    
    depends_on = []
}