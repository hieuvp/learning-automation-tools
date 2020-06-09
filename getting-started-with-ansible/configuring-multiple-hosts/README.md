# Configuring Multiple Hosts

<div align="center"><img src="assets/ansible-architecture.png" width="900"></div>

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
