terraform {
  required_version = ">= 0.12.24"

#  backend "s3" {}

  required_providers {
        oci = "~> 3.75"
    }
}

data "oci_identity_compartments" "compartments" {
    # Required
    compartment_id = var.tenancy_OCID

    # Optional
    access_level = "ACCESSIBLE"
    compartment_id_in_subtree = true
}

locals {
    compartment_ids = zipmap(data.oci_identity_compartments.compartments.compartments[*].name, data.oci_identity_compartments.compartments.compartments[*].id)
}

resource "oci_core_instance" "compute_instance" {

    Required
    availability_domain = var.availability_domain
    compartment_id = lookup(local.compartment_ids,var.compartment_name)
    shape = var.instance_shape

    agent_config {
        is_monitoring_disabled = false;
        is_management_disabled = true;
    }

    dynamic "create_vnic_details" {
        for_each = list(var.vnic_details)

        content {
          # Required 
          subnet_id = create_vnic_details.value["subnet_OCID"]
          assign_public_id = create_vnic_details.value["assign_public_id"]
          display_name = format("Primary VNIC for the instance %S", create_vnic_details.value["hostname_label"])
          hostname_label = create_vnic_details.value["hostname_label"]
          private_id = create_vnic_details.value["private_id"]
        }
    }

    dynamic "launch_options" {
        for_each = var_instance_launch_options == null ? [] : list(var.var_instance_launch_options)

        content {
          boot_volume_type = launch_options.value["boot_volume_type"]
          firmware = launch_options.value["firmware"]
          is_consistent_volume_naming_enabled = launch_options.value["is_consistent_volume_naming_enabled"]
          is_pv_encryption_in_transit_enabled = launch_options.value["is_pv_encryption_in_transit_enabled"]
          network_type = launch_options.value["network_type"]
          remote_data_volume_type = launch_options.value["remote_data_volume_type"]
        }
    }
}

resource "oci_core_boot_volume_backup" "backup_boot_volume" {
    count var.backup_boot_volume == true ? 1 : 0
    # Required
    boot_volume_id = oci_core_instance
    type = var.backu_type
}
