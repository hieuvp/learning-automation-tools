locals {
  application = "Ansible"
  environment = "Test"

  region        = "ap-southeast-1"
  instance_type = "t2.nano"
}

data "aws_ami" "ubuntu" {
  owners      = ["amazon", "aws-marketplace"]
  most_recent = true

  filter {
    name   = "name"
    values = ["github-actions-runner"]
  }
}

resource "aws_instance" "ubuntu" {
  count = 2

  ami = data.aws_ami.ubuntu.id

  instance_type = local.instance_type
  key_name      = var.ssh_key_name

  tags = {
    Name        = "${upper(local.environment)}-${lower(local.application)}"
    Application = local.application
    Environment = local.environment
  }
}
