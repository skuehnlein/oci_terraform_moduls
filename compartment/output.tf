output "compartments" {
    value = zipmap(oci_identity_compartment.compartment[*].name,oci_identity_compartment.compartment[*].id)

}