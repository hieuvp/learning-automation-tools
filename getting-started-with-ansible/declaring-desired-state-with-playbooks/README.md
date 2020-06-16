# Declaring Desired State with Playbooks

![Anchoring Analogy](assets/anchoring-analogy.png)

## [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

### Playbooks

> **Playbooks** are the language by which
> Ansible **orchestrates**, **configures**, **administers**, or **deploys** systems.

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

<div align="center"><img src="assets/ansible-localhost.png" width="350"></div>

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/master.gitconfig) -->
<!-- The below code snippet is automatically added from labs/master.gitconfig -->

```gitconfig
[user]
	name = Harrison Van
	email = software.engineer@shopback.com
```

<!-- AUTO-GENERATED-CONTENT:END -->

## Running `ansible-playbook` for the First Time

## Testing `ansible-playbook` by Removing and Restoring Our `.gitconfig`

## Increasing `ansible-playbook` Output Verbosity

## I Cannot Emphasize Enough the Value of Versioning Playbooks with Git

## Adding a Second Play with Two Tasks

## What Happens When We Have a Syntax Error in a Playbook
