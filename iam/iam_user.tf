# Creates all requiered users
resource "oci_identity_user" "user" {
    name = "User"
    compartment_id = var.tenancy_OCID
    description = "OCI IAM User for "

    dynamic "user" {
        for_each var.iam_users
        content {
            name = user.value["user_name"]
            description = "OCI IAM User for "
        }
    }
}
