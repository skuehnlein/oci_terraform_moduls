# Creates all requiered groups
resource "oci_identity_group" "groups" {
    for_each = var.iam_groups

    # Required
    compartment_id = var.tenancy_OCID
    name = each.value["group_name"]
    description = each.value["group_description"]
}