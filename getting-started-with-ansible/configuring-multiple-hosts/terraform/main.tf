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
