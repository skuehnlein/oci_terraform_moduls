output "vcn_OCID" {
    description = "OCID of the created VCN"
    value = oci_core_vcn.vcn.id
}

output "nat_gateway_OCID" {
    description = "OCID of the created NAT Gateway"
    value = join(",", oci_core_nat_gateway.nat_gateway.*.id)
} 

output "nat_gateway_IP" {
    description = "IP address of the NAT Gateway"
    value = join(",", oci_core_nat_gateway.nat_gateway.*.nat_ip)
}

output "internet_gateway_OCID" {
    description = "OCID of the created Internet Gateway"
    value = join(",", oci_core_internet_gateway.internet_gateway.*.id)
} 

output "dynamic_routing_gateway_OCID" {
    description = "OCID of the created Dynamic Routing Gateway"
    value = join(",", oci_core_drg.dynamic_routing_gateway.*.id)
} 

#output "drg_route_table_OCID" {
#    description = "OCID of the Route Table for the Dynamic Routing Gateway"
#    value = join(",",oci_core_route_table.drg_route_table.*.id)
#}

output "nat_route_table_OCID" {
    description = "OCID of the Route Table for the Nat Gateway"
    value = join(",",oci_core_route_table.nat_gateway_route_table.*.id)
}

output "internet_gateway_route_table_OCID" {
    description = "OCID of the Route Table for the Internet Gateway"
    value = join(",",oci_core_route_table.internet_gateway_route_table.*.id)
}
