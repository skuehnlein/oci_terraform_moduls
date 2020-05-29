output "compartments" {
    value = data.oci_identity_compartments.all_compartments.compartments[*].name
}