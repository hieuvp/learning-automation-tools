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

  ami = data.aws_ami.amazon_linux.id

  instance_type = local.instance_type
  key_name      = var.key_name

  tags = local.tags
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

  ami = data.aws_ami.ubuntu.id

  instance_type = local.instance_type
  key_name      = var.key_name

  tags = local.tags
}
