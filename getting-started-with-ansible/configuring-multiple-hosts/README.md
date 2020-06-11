# Configuring Multiple Hosts

![Ansible's Push Model](assets/ansible-push-model.png)

## [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

### Inventory

> A file (by default, Ansible uses a simple INI format)
> that describes Hosts and Groups in Ansible.<br />
> Inventory can also be provided via an Inventory Script
> (sometimes called an `External Inventory Script`).

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [What Is Inventory](#what-is-inventory)
- [Creating Test VMs with Vagrant](#creating-test-vms-with-vagrant)
- [Perusing My Inventory Directory Example and a Bit About `ansible-config list` and `INVENTORY_IGNORE_EXTS`](#perusing-my-inventory-directory-example-and-a-bit-about-ansible-config-list-and-inventory_ignore_exts)
- [VMs Are Operational with No Git Configuration](#vms-are-operational-with-no-git-configuration)
- [Groups and Hosts and Ansible Ad-hoc with Multiple Hosts](#groups-and-hosts-and-ansible-ad-hoc-with-multiple-hosts)
- [Walking through the Playbook We Will Run against All VM Hosts](#walking-through-the-playbook-we-will-run-against-all-vm-hosts)
- [Running Our Playbook against Multiple VMs to Install and Configure Git](#running-our-playbook-against-multiple-vms-to-install-and-configure-git)
- [Destroying and Recreating Is Scalable and Reproducible](#destroying-and-recreating-is-scalable-and-reproducible)
- [Configuring Ansible with `ansible.cfg`](#configuring-ansible-with-ansiblecfg)
- [Summarizing Inventory with `ansible-inventory --graph` and with `--vars`](#summarizing-inventory-with-ansible-inventory---graph-and-with---vars)
- [Drilling into How Inventory Can Be Represented including with Static INI Files and Inventory Scripts](#drilling-into-how-inventory-can-be-represented-including-with-static-ini-files-and-inventory-scripts)
- [Troubleshooting Inventory Scripts by Running Them Independently before Plugging Them into Ansible](#troubleshooting-inventory-scripts-by-running-them-independently-before-plugging-them-into-ansible)
- [Ansible Uses Inventory Plugins to Provide Inventory in Any Number of Formats including Static and Dynamic](#ansible-uses-inventory-plugins-to-provide-inventory-in-any-number-of-formats-including-static-and-dynamic)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What Is Inventory

## Creating Test VMs with Vagrant

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=terraform/variables.tf) -->
<!-- The below code snippet is automatically added from terraform/variables.tf -->

```tf
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
}
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=terraform/main.tf) -->
<!-- The below code snippet is automatically added from terraform/main.tf -->

```tf
# Source: terraform/main.tf

provider "aws" {
  region = var.region
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Amazon Linux 2 (HVM)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

data "aws_ami" "amazon_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "amazon_linux" {
  count = 2

  ami           = data.aws_ami.amazon_linux.id
  instance_type = local.instance_type
  key_name      = var.key_name

  tags = merge(local.tags, {
    Name     = "${local.tags.Name}-amazon-linux-${count.index + 1}"
    Platform = "Amazon Linux"
  })
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu Server 18 LTS (HVM)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/*/ubuntu-bionic-18.*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "ubuntu" {
  count = 2

  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  key_name      = var.key_name

  tags = merge(local.tags, {
    Name     = "${local.tags.Name}-ubuntu-${count.index + 1}"
    Platform = "Ubuntu"
  })
}
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=terraform/outputs.tf) -->
<!-- The below code snippet is automatically added from terraform/outputs.tf -->

```tf
# Source: terraform/outputs.tf

output "region" {
  value       = var.region
  description = "The region where all of your ec2 instances are located"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Amazon Linux 2 (HVM)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "amazon_linux_ami" {
  value       = data.aws_ami.amazon_linux.name
  description = "The Amazon Linux AMI name"
}

output "amazon_linux_private_ips" {
  value       = aws_instance.amazon_linux[*].private_ip
  description = "The private IPs of Amazon Linux instances"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu Server 18 LTS (HVM)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "ubuntu_ami" {
  value       = data.aws_ami.ubuntu.name
  description = "The Ubuntu AMI name"
}

output "ubuntu_private_ips" {
  value       = aws_instance.amazon_linux[*].private_ip
  description = "The private IPs of Ubuntu instances"
}
```

<!-- AUTO-GENERATED-CONTENT:END -->

```shell script
cd getting-started-with-ansible/configuring-multiple-hosts/terraform
terraform apply
```

## Perusing My Inventory Directory Example and a Bit About `ansible-config list` and `INVENTORY_IGNORE_EXTS`

## VMs Are Operational with No Git Configuration

## Groups and Hosts and Ansible Ad-hoc with Multiple Hosts

## Walking through the Playbook We Will Run against All VM Hosts

## Running Our Playbook against Multiple VMs to Install and Configure Git

## Destroying and Recreating Is Scalable and Reproducible

## Configuring Ansible with `ansible.cfg`

## Summarizing Inventory with `ansible-inventory --graph` and with `--vars`

## Drilling into How Inventory Can Be Represented including with Static INI Files and Inventory Scripts

## Troubleshooting Inventory Scripts by Running Them Independently before Plugging Them into Ansible

## Ansible Uses Inventory Plugins to Provide Inventory in Any Number of Formats including Static and Dynamic
