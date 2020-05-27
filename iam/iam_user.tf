# Creates all requiered users
resource "oci_identity_user" "user" {

    compartment_id = var.tenancy_OCID

    dynamic "iam_users" {
        for_each var.iam_users
        content {
            name = iam_users.value["user_name"]
            description = "OCI IAM User for ${iam_users.value[\"user_email\"]}"
        }
    }
}
