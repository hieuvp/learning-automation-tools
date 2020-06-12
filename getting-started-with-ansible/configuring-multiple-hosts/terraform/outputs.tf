# Source: terraform/outputs.tf

output "region" {
  value       = var.region
  description = "The region where all of your ec2 instances are located"
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

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu Server 18 LTS Instances
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "ubuntu_ami" {
  value       = data.aws_ami.ubuntu.name
  description = "The Ubuntu AMI name"
}

output "ubuntu_private_ips" {
  value       = aws_instance.amazon_linux[*].private_ip
  description = "The private IPs of Ubuntu instances"
}
