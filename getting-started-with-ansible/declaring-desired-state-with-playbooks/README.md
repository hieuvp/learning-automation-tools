# Declaring Desired State with Playbooks

![Ansible Localhost](assets/ansible-localhost.png)

## [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

### Playbooks

> **Playbooks** are the language by which
> Ansible **orchestrates**, **configures**, **administers**, or **deploys** systems.

Ordered lists of tasks, saved so you can run those tasks in that order repeatedly.
Playbooks can include variables as well as tasks.
Playbooks are written in YAML and are easy to read, write, share and understand.

### Plays

> A playbook is a list of plays.
> A play is minimally a mapping between a set of hosts selected by a host specifier
> (usually chosen by groups but sometimes by hostname globs)
> and the tasks which run on those hosts to define the role that those systems will perform.
> There can be one or many plays in a playbook.

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

The units of action in Ansible.
You can execute a single task once with an ad-hoc command.

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

The units of code Ansible executes.
Each module has a particular use,
from administering users on a specific type of database
to managing VLAN interfaces on a specific type of network device.
You can invoke a single module with a task, or invoke several different modules in a playbook.
For an idea of how many modules Ansible includes,
take a look at the list of all modules.

These programs are written to be resource models of the desired state of the system.

Your library of modules can reside on any machine,
and there are no servers, daemons, or databases required.

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
- [References](#references)

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
- name: Ensure .gitconfig copied from master.gitconfig
  hosts: localhost
  tasks:
    - file: path="/tmp/learning-ansible" state=directory mode=0755
    - copy: src="master.gitconfig" dest="/tmp/learning-ansible/.gitconfig"
```

<!-- AUTO-GENERATED-CONTENT:END -->

## Running `ansible-playbook` for the First Time

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/playbook.console) -->
<!-- The below code snippet is automatically added from labs/playbook.console -->

```console
+ rm -f /tmp/learning-ansible/.gitconfig
+ cat /tmp/learning-ansible/.gitconfig
cat: /tmp/learning-ansible/.gitconfig: No such file or directory
+ echo

+ ansible-playbook playbook.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Ensure ~/.gitconfig copied from master.gitconfig] **********************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************
ok: [localhost]

TASK [file] ******************************************************************************************************************************************************************
ok: [localhost]

TASK [copy] ******************************************************************************************************************************************************************
changed: [localhost]

PLAY RECAP *******************************************************************************************************************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

+ ansible-playbook playbook.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Ensure ~/.gitconfig copied from master.gitconfig] **********************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************
ok: [localhost]

TASK [file] ******************************************************************************************************************************************************************
ok: [localhost]

TASK [copy] ******************************************************************************************************************************************************************
ok: [localhost]

PLAY RECAP *******************************************************************************************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

+ cat /tmp/learning-ansible/.gitconfig
[user]
	name = Harrison Van
	email = software.engineer@shopback.com
```

<!-- AUTO-GENERATED-CONTENT:END -->

## Testing `ansible-playbook` by Removing and Restoring Our `.gitconfig`

## Increasing `ansible-playbook` Output Verbosity

## I Cannot Emphasize Enough the Value of Versioning Playbooks with Git

## Adding a Second Play with Two Tasks

## What Happens When We Have a Syntax Error in a Playbook

## References

- [Getting Started with Ansible for Network Automation - Basic Concepts](https://docs.ansible.com/ansible/latest/network/getting_started/basic_concepts.html)
