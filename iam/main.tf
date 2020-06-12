terraform {
  required_version = ">= 0.12.24"

  backend "s3" {}

  required_providers {
        oci = "~> 3.75"
    }
}
