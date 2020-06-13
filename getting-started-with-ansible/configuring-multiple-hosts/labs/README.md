# Spin up Ansible multi VM lab with Vagrant

- Vagrant makes it easy to spin up VMs
  (in this case using virtualbox and pre-built vagrant boxes for ubuntu and centos)

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Instructions for following along](#instructions-for-following-along)
- [Notes](#notes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Instructions for following along

- Install
  - Vagrant: <https://www.vagrantup.com/docs/installation/>
  - VirtualBox: <https://www.virtualbox.org/wiki/Downloads>
- Create VMs
  - `cd` into this folder
  - `vagrant up` creates all VMs
    - or `vagrant up ubuntu10` to create one of the VMs
    - or pass other patterns to `vagrant up` to create other subsets of the VMs

## Notes

- As time passes you may want to update the OS versions
  and respective vagrant boxes in the `Vagrantfile`
  - Or, change vagrant boxes to simulate a different environment (ie OS)
    and experiment with what you can do with Ansible in that environment.
  - Vagrant box search: <https://app.vagrantup.com/boxes/search>
- Vagrant docs: <https://www.vagrantup.com/docs/>
- Vagrant provisioners for Ansible:
  - Vagrant provides two Ansible provisioners
    that are alternatives to the way I demo Ansible in the course.
    Once you're comfortable with Ansible,
    these are a nice way to combine the two tools in a way that
    declaratively describes what Vagrant should have Ansible provision.
  - Run `ansible-playbook` on VM host: <https://www.vagrantup.com/docs/provisioning/ansible.html>
  - Run `ansible-playbook` on guest VM: <https://www.vagrantup.com/docs/provisioning/ansible_local.html>
