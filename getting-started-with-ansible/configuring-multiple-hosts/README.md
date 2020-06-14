# Configuring Multiple Hosts

![Ansible's Push Model](assets/ansible-push-model.png)

Now, one more aspect of connecting,
if you will, is to turn on its head the entire notion
that we've talked about in this course of Ansel reaching out to these other nodes,
sitting out commands or files and then executing those files or commands
and then getting results back,
turning that on its head, that push model into a pull model.
And that's what the answer will Pole command does with danceable pull.
On the other hand, we still have our manage nodes.

## [Basic Concepts](https://docs.ansible.com/ansible/latest/network/getting_started/basic_concepts.html)

### Control Node

Any machine with Ansible installed.
You can run commands and playbooks,
invoking `/usr/bin/ansible` or `/usr/bin/ansible-playbook`, from any control node.
You can use any computer that has Python installed on it as a control node -
laptops, shared desktops, and servers can all run Ansible.
However, you cannot use a Windows machine as a control node.
You can have multiple control nodes.

### Managed Nodes

The network devices (and/or servers) you manage with Ansible.
Managed nodes are also sometimes called `hosts`.
Ansible is not installed on managed nodes.

### Inventory

A list of managed nodes.
An inventory file is also sometimes called a “hostfile”.
Your inventory can specify information like IP address for each managed node.
An inventory can also organize managed nodes, creating and nesting groups for easier scaling.
To learn more about inventory, see the Working with Inventory section.

### Modules

The units of code Ansible executes.
Each module has a particular use,
from administering users on a specific type of database
to managing VLAN interfaces on a specific type of network device.
You can invoke a single module with a task, or invoke several different modules in a playbook.
For an idea of how many modules Ansible includes,
take a look at the list of all modules.

### Tasks

The units of action in Ansible.
You can execute a single task once with an ad-hoc command.

### Playbooks

Ordered lists of tasks, saved so you can run those tasks in that order repeatedly.
Playbooks can include variables as well as tasks.
Playbooks are written in YAML and are easy to read, write, share and understand.
To learn more about playbooks, see About Playbooks.

## [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

### Push Mode

> Push mode is the default mode of Ansible.
> In fact, it's not really a mode at all –
> it's just how Ansible works when you aren't thinking about it.
> Push mode allows Ansible to be fine-grained
> and conduct nodes through complex orchestration processes without waiting for them to check in.

### Inventory - Temp

> A file (by default, Ansible uses a simple INI format)
> that describes Hosts and Groups in Ansible.<br />
> Inventory can also be provided via an Inventory Script
> (sometimes called an `External Inventory Script`).

### Inventory Script

> A very simple program (or a complicated one) that looks up hosts, group membership for hosts,
> and variable information from an external resource –
> whether that be a SQL database, a CMDB solution, or something like LDAP.
> This concept was adapted from Puppet (where it is called an `External Nodes Classifier`)
> and works more or less exactly the same way.

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [What Is Inventory](#what-is-inventory)
- [Creating Test EC2 Instances with Terraform](#creating-test-ec2-instances-with-terraform)
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

## Creating Test EC2 Instances with Terraform

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
# Amazon Linux 2 Instances
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

resource "cloudflare_record" "amazon_linux" {
  count = length(aws_instance.amazon_linux)

  zone_id = local.domain_id

  type    = "A"
  name    = "${lower(local.application)}-amazon-linux-${count.index + 1}"
  value   = aws_instance.amazon_linux[count.index].private_ip
  ttl     = "1"
  proxied = "false"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu Server 18 LTS Instances
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

resource "cloudflare_record" "ubuntu" {
  count = length(aws_instance.ubuntu)

  zone_id = local.domain_id

  type    = "A"
  name    = "${lower(local.application)}-ubuntu-${count.index + 1}"
  value   = aws_instance.ubuntu[count.index].private_ip
  ttl     = "1"
  proxied = "false"
}
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=terraform/outputs.tf) -->
<!-- The below code snippet is automatically added from terraform/outputs.tf -->

```tf
# Source: terraform/outputs.tf

output "region" {
  value       = var.region
  description = "The region where all instances are hosted"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Amazon Linux 2 Instances
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "amazon_linux_ami" {
  value       = data.aws_ami.amazon_linux.name
  description = "The Amazon Linux AMI name"
}

output "amazon_linux_private_ips" {
  value       = aws_instance.amazon_linux[*].private_ip
  description = "The private IPs of Amazon Linux instances"
}

output "amazon_linux_dns_records" {
  value       = cloudflare_record.amazon_linux[*].hostname
  description = "The DNS records of Amazon Linux instances"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu Server 18 LTS Instances
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "ubuntu_ami" {
  value       = data.aws_ami.ubuntu.name
  description = "The Ubuntu AMI name"
}

output "ubuntu_private_ips" {
  value       = aws_instance.ubuntu[*].private_ip
  description = "The private IPs of Ubuntu instances"
}

output "ubuntu_dns_records" {
  value       = cloudflare_record.ubuntu[*].hostname
  description = "The DNS records of Ubuntu instances"
}
```

<!-- AUTO-GENERATED-CONTENT:END -->

```shell script
cd getting-started-with-ansible/configuring-multiple-hosts/terraform
terraform apply
```

## Creating Test VMs with Vagrant

## Perusing My Inventory Directory Example and a Bit About `ansible-config list` and `INVENTORY_IGNORE_EXTS`

```shell script
ansible-config list
```

- `inventory_dir` is the pathname of the directory holding Ansible's inventory host file,
- `inventory_file` is the pathname and the filename pointing to the Ansible's inventory host file.

```yaml
INVENTORY_IGNORE_EXTS:
  default: "{{(BLACKLIST_EXTS + ( '.orig', '.ini', '.cfg', '.retry'))}}"
  description: List of extensions to ignore when using a directory as an inventory
    source
  env:
    - name: ANSIBLE_INVENTORY_IGNORE
  ini:
    - key: inventory_ignore_extensions
      section: defaults
    - key: ignore_extensions
      section: inventory
  name: Inventory ignore extensions
  type: list
```

## VMs Are Operational with No Git Configuration

## Groups and Hosts and Ansible Ad-hoc with Multiple Hosts

```shell script
ansible-inventory --list
```

```shell script
ansible-inventory --graph
ansible-inventory --graph --vars
```

## Walking through the Playbook We Will Run against All VM Hosts

## Running Our Playbook against Multiple VMs to Install and Configure Git

## Destroying and Recreating Is Scalable and Reproducible

## [Configuring Ansible with `ansible.cfg`](https://docs.ansible.com/ansible/latest/installation_guide/intro_configuration.html)

> Certain settings in Ansible are adjustable via a configuration file (`ansible.cfg`).
> The stock configuration should be sufficient for most users,
> but there may be reasons you would want to change them.
> Paths where configuration file is searched are listed in reference documentation.

<https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings-locations>
<https://docs.ansible.com/ansible/latest/reference_appendices/config.html#the-configuration-file>
<https://docs.ansible.com/ansible/latest/reference_appendices/config.html#the-configuration-file>

Changes can be made and used in a configuration file
which will be searched for in the following order:

- `ANSIBLE_CONFIG` (environment variable if set)
- `ansible.cfg` (in the current directory)
- `~/.ansible.cfg` (in the home directory)
- `/etc/ansible/ansible.cfg`

Ansible will process the above list and use the first file found,
all others are ignored.

The configuration file is one variant of an INI format.
Both the hash sign (`#`) and semicolon (`;`)
are allowed as comment markers when the comment starts the line.
However, if the comment is inline with regular values,
only the semicolon is allowed to introduce the comment.
For instance:

```ini
# some basic default values...
inventory = /etc/ansible/hosts  ; This points to the file that lists your hosts
```

<https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html>

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/ansible.cfg) -->
<!-- The below code snippet is automatically added from labs/ansible.cfg -->

```cfg
[defaults]
# disable host_key_checking
# https://docs.ansible.com/ansible/latest/user_guide/connection_details.html#host-key-checking
host_key_checking = False

inventory = hosts.yml
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=scripts/ansible-inventory-list.console) -->
<!-- The below code snippet is automatically added from scripts/ansible-inventory-list.console -->

```console
+ ansible-inventory --list
{
    "_meta": {
        "hostvars": {
            "centos20": {
                "ansible_host": "192.168.50.20",
                "ansible_port": 22,
                "ansible_private_key_file": ".vagrant/machines/centos20/virtualbox/private_key",
                "ansible_user": "vagrant"
            },
            "centos21": {
                "ansible_host": "192.168.50.21",
                "ansible_port": 22,
                "ansible_private_key_file": ".vagrant/machines/centos21/virtualbox/private_key",
                "ansible_user": "vagrant"
            },
            "localhost": {
                "ansible_connection": "local",
                "ansible_python_interpreter": "/usr/local/bin/python3"
            },
            "ubuntu10": {
                "ansible_host": "192.168.50.10",
                "ansible_port": 22,
                "ansible_private_key_file": ".vagrant/machines/ubuntu10/virtualbox/private_key",
                "ansible_user": "vagrant"
            },
            "ubuntu11": {
                "ansible_host": "192.168.50.11",
                "ansible_port": 22,
                "ansible_private_key_file": ".vagrant/machines/ubuntu11/virtualbox/private_key",
                "ansible_user": "vagrant"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "vagrant"
        ]
    },
    "centos": {
        "hosts": [
            "centos20",
            "centos21"
        ]
    },
    "ubuntu": {
        "hosts": [
            "ubuntu10",
            "ubuntu11"
        ]
    },
    "ungrouped": {
        "hosts": [
            "localhost"
        ]
    },
    "vagrant": {
        "children": [
            "centos",
            "ubuntu"
        ]
    }
}
```

<!-- AUTO-GENERATED-CONTENT:END -->

## Summarizing Inventory with `ansible-inventory --graph` and with `--vars`

## Drilling into How Inventory Can Be Represented including with Static INI Files and Inventory Scripts

## Troubleshooting Inventory Scripts by Running Them Independently before Plugging Them into Ansible

## Ansible Uses Inventory Plugins to Provide Inventory in Any Number of Formats including Static and Dynamic
