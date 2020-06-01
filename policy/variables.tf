variable "compartment_policies" {
    description = "The definition of all policies which should be created"
    type = map(object({
        name = string,
        compartment_name = string,
        description = string,
        statement = list(string)
    }))
}