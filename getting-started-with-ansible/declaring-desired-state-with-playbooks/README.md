# Declaring Desired State with Playbooks

## [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

### Playbooks

> **Playbooks** are the language by which
> Ansible **orchestrates**, **configures**, **administers**, or **deploys** systems.

### Host

> A host is simply a remote machine that Ansible manages.
> They can have individual variables assigned to them,
> and can also be organized in groups.
> All hosts have a name they can be reached at (which is either an IP address or a domain name) and,
> optionally, a port number, if they are not to be accessed on the default SSH port.

### Task

> Playbooks exist to run tasks.
> Tasks combine an action (a module and its arguments) with a name
> and optionally some other keywords (like looping directives).
> Handlers are also tasks, but they are a special kind of task
> that do not run unless they are notified by name
> when a task reports an underlying change on a remote system.

### Modules

> Modules are the units of work that Ansible ships out to remote machines.
> Modules are kicked off by either `/usr/bin/ansible` or `/usr/bin/ansible-playbook`
> (where multiple tasks use lots of different modules in conjunction).
> Modules can be implemented in any language, including Perl, Bash, or Ruby –
> but can leverage some useful communal library code if written in Python.
> Modules just have to return JSON.
> Once modules are executed on remote machines,
> they are removed, so no long-running daemons are used.
> Ansible refers to the collection of available modules as a library.

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Ansible Is a Framework for Idempotent Commands](#ansible-is-a-framework-for-idempotent-commands)
- [How About Just Scripting Multiple Ad-hoc Calls](#how-about-just-scripting-multiple-ad-hoc-calls)
- [Morphing Ad-hoc Calls or Scripted Ad-hoc Calls into Ansible Playbooks](#morphing-ad-hoc-calls-or-scripted-ad-hoc-calls-into-ansible-playbooks)
- [`docker` Is to `docker-compose` What `ansible` Is to `ansible-playbook`](#docker-is-to-docker-compose-what-ansible-is-to-ansible-playbook)
- [What a Script of Ad-hoc Ansible Calls Looks Like](#what-a-script-of-ad-hoc-ansible-calls-looks-like)
- [Writing a First Playbook to Ensure Our `.gitconfig` Is Setup](#writing-a-first-playbook-to-ensure-our-gitconfig-is-setup)
- [Running `ansible-playbook` for the First Time](#running-ansible-playbook-for-the-first-time)
- [Testing `ansible-playbook` by Removing and Restoring Our `.gitconfig`](#testing-ansible-playbook-by-removing-and-restoring-our-gitconfig)
- [Increasing `ansible-playbook` Output Verbosity](#increasing-ansible-playbook-output-verbosity)
- [I Cannot Emphasize Enough the Value of Versioning Playbooks with Git](#i-cannot-emphasize-enough-the-value-of-versioning-playbooks-with-git)
- [Adding a Second Play with Two Tasks](#adding-a-second-play-with-two-tasks)
- [What Happens When We Have a Syntax Error in a Playbook](#what-happens-when-we-have-a-syntax-error-in-a-playbook)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Ansible Is a Framework for Idempotent Commands

## How About Just Scripting Multiple Ad-hoc Calls

## Morphing Ad-hoc Calls or Scripted Ad-hoc Calls into Ansible Playbooks

## `docker` Is to `docker-compose` What `ansible` Is to `ansible-playbook`

## What a Script of Ad-hoc Ansible Calls Looks Like

## Writing a First Playbook to Ensure Our `.gitconfig` Is Setup

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/playbook.yml) -->
<!-- The below code snippet is automatically added from labs/playbook.yml -->

```yml
# $ ansible -m copy -a "src=../adhoc/master.gitconfig dest=~/.gitconfig" localhost
- name: Ensure ~/.gitconfig copied from master.gitconfig
  hosts: localhost
  tasks:
    - file: path="/tmp/learning-ansible" state=directory mode=0755
    - copy: src="master.gitconfig" dest="/tmp/learning-ansible/.gitconfig"
#
# - name: Ensure homebrew packages are installed.
#   hosts: localhost
#   tasks:
#     # $ ansible -m homebrew -a "name=bat state=latest" localhost
#     - homebrew: name=bat state=latest
#
#     # $ ansible -m homebrew -a "name=jq state=latest" localhost
#     - homebrew:
#         name: jq
#         state: latest
```

<!-- AUTO-GENERATED-CONTENT:END -->

## Running `ansible-playbook` for the First Time

```shell script
ansible-playbook playbook.yml
```

## Testing `ansible-playbook` by Removing and Restoring Our `.gitconfig`

## Increasing `ansible-playbook` Output Verbosity

## I Cannot Emphasize Enough the Value of Versioning Playbooks with Git

## Adding a Second Play with Two Tasks

## What Happens When We Have a Syntax Error in a Playbook
