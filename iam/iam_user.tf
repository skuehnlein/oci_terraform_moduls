# Creates all requiered users
resource "oci_identity_user" "user" {
    for_each = var.iam_users

    # Required
    compartment_id = var.tenancy_OCID
    name = each.value["user_name"]
    description = "OCI IAM User for " each.value["user_email"]

}
