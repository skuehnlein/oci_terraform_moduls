output "vcn_OCID" {
    description = "OCID of the created VCN"
    value = oci_core_vcn.vcn.id
}

output "nat_gateway_OCID" {
    description = "OCID of the created NAT Gateway"
    oci_core_nat_gateway.nat_gateway.id
} 

output "nat_gateway_IP" {
    description = "IP address of the NAT Gateway"
    oci_core_nat_gateway.nat_gateway.nat_id
}

output "internet_gateway_OCID" {
    description = "OCID of the created NAT Gateway"
    oci_core_nat_gateway.internet_gateway.id
} 

output "drg_OCID" {
    description = "OCID of the created Dynamic Routing Gateway"
    oci_core_drg.dynamic_routing_gateway.id
} 

