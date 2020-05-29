terraform {
  required_version = ">= 0.12.24"

  backend "s3" {}

  required_providers {
        oci = "~> 3.75"
    }
}

# Creates all requiered users
resource "oci_identity_user" "users" {
    for_each = var.iam_users

    # Required
    compartment_id = var.tenancy_OCID
    name = each.value["user_name"]
    description = " IAM User for  ${each.value["user_email"]} "
}
# Creates all requiered groups
resource "oci_identity_group" "groups" {
    for_each = var.iam_groups

    # Required
    compartment_id = var.tenancy_OCID
    name = each.value["group_name"]
    description = each.value["group_description"]
}

data "oci_identity_users" "users" {
    # Required
    compartment_id = var.tenancy_OCID
}

data "oci_identity_groups" "groups" {
    # Required
    compartment_id = var.tenancy_OCID
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
}
