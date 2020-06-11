# Alternatives to SSH for Connecting to Hosts

## [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

- Push Mode
  Push mode is the default mode of Ansible.
  In fact, it's not really a mode at all –
  it's just how Ansible works when you aren't thinking about it.
  Push mode allows Ansible to be fine-grained
  and conduct nodes through complex orchestration processes without waiting for them to check in.
- Pull Mode
  By default, Ansible runs in push mode,
  which allows it very fine-grained control over when it talks to each system.
  Pull mode is provided for
  when you would rather have nodes check in every N minutes on a particular schedule.
  It uses a program called `ansible-pull`
  and can also be set up (or reconfigured) using a `push-mode` playbook.
  Most Ansible users use push mode,
  but pull mode is included for variety and the sake of having choices.
  `ansible-pull` works by checking configuration orders out of git on a crontab
  and then managing the machine locally,
  using the local connection plugin.

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Perusing the Connection Plugins](#perusing-the-connection-plugins)
- [Visualizing Connection Plugins, Specifically the Docker Connection Plugin](#visualizing-connection-plugins-specifically-the-docker-connection-plugin)
- [`ansible-doc -t connection docker`](#ansible-doc--t-connection-docker)
- [Creating Three Background Containers with a Playbook](#creating-three-background-containers-with-a-playbook)
- [Using `ansible-console` to Quickly Inspect Our Newly Created Containers](#using-ansible-console-to-quickly-inspect-our-newly-created-containers)
- [Configuring `git` in Our Three Containers](#configuring-git-in-our-three-containers)
- [Force Killing and Destroying Our Containers at Mock Speed with state=absent and force_kill=yes docker_container Module Parameters](#force-killing-and-destroying-our-containers-at-mock-speed-with-stateabsent-and-force_killyes-docker_container-module-parameters)
- [Making and Testing a Hypothesis About Ansible Using `docker container exec`](#making-and-testing-a-hypothesis-about-ansible-using-docker-container-exec)
- [`ansible-pull` Is yet Another Connection Approach](#ansible-pull-is-yet-another-connection-approach)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Perusing the Connection Plugins

## Visualizing Connection Plugins, Specifically the Docker Connection Plugin

## `ansible-doc -t connection docker`

## Creating Three Background Containers with a Playbook

## Using `ansible-console` to Quickly Inspect Our Newly Created Containers

## Configuring `git` in Our Three Containers

## Force Killing and Destroying Our Containers at Mock Speed with state=absent and force_kill=yes docker_container Module Parameters

## Making and Testing a Hypothesis About Ansible Using `docker container exec`

## `ansible-pull` Is yet Another Connection Approach
