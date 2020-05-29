#output "created_compartments" {
#    description = "Created Compartments"
#    value = zipmap(values(oci_identity_compartment.compartment)[*].name,values(oci_identity_compartment.compartment)[*].id)
#}

output "all_defined_compartmetns" {
    value = join(",",oci_identity_compartments.all_compartments.compartments[*].name)
}
