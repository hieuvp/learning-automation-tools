# Source: terraform/variables.tf

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Variables
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

variable "region" {
  type = string
}

variable "key_name" {
  type = string
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Locals
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

locals {
  application = "Ansible"
  environment = "Test"

  tags = {
    Name        = "${upper(local.environment)}-${lower(local.application)}"
    Application = local.application
    Environment = local.environment
  }
}

locals {
  instance_type = "t2.nano"

  domain_name = "shopback.engineering"
  domain_id   = data.cloudflare_zones.this.zones[0].id
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Data
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

data "cloudflare_zones" "this" {
  filter {
    name   = local.domain_name
    status = "active"
    paused = false
  }
}
