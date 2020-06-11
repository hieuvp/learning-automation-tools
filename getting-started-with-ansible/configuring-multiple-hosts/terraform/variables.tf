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

  instance_type = "t2.nano"
}

locals {
  tags = {
    Name        = "${upper(local.environment)}-${lower(local.application)}"
    Application = local.application
    Environment = local.environment
  }
}
