# Ad-Hoc Configuration with Idempotent Modules

## Dictionary

### Ad Hoc - English Vietnamese

> ad hoc `/ˌæd ˈhɒk/` (adjective).

| English                                                          | Vietnamese           | Example                                     |
| ---------------------------------------------------------------- | -------------------- | ------------------------------------------- |
| Arranged or happening when necessary and not planned in advance. | Không dự tính trước. | An ad hoc meeting to deal with the problem. |

### Idempotency - English Vietnamese

> [idempotent](https://en.wiktionary.org/wiki/idempotent) [`/aɪ.dəmˈpoʊ.tənt/`](https://dictionary.cambridge.org/pronunciation/english/idempotent)
> (`idem` +‎ `potent`) (adjective).
> <br />idempotency (`idem` +‎ `potency`) (noun).

<table>
  <tr>
    <th><a href="https://www.vocabulary.com/dictionary/idempotent">English</a></th>
    <th>Vietnamese</th>
  </tr>
  <tr>
    <td>
      In mathematics, a number that is <b>idempotent</b><br />
      keeps the same value when multiplied by itself,<br />
      no matter how many times the function is applied.
    </td>
    <td>
      (Toán học)<br />
      Không thay đổi giá trị sau khi tự nó nhân lên.
    </td>
  </tr>
</table>

<br />

## [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

### Ad Hoc

> Referring to running Ansible to perform some quick command, using `/usr/local/bin/ansible`,
> <br />rather than the orchestration language, which is `/usr/local/bin/ansible-playbook`.
> <br />Anything you can do **ad hoc** can be accomplished by writing a **playbook**
> and **playbooks** can also glue lots of other operations together.

### Idempotency

> An operation is **idempotent** if
> the result of performing it once is exactly the same as
> the result of performing it repeatedly without any intervening actions.

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Using the `git config` Command to Manually Configure User Name and Email](#using-the-git-config-command-to-manually-configure-user-name-and-email)
- [A Repeatable Script to Automatically Configure Git with `user.name` and `user.email`](#a-repeatable-script-to-automatically-configure-git-with-username-and-useremail)
- [`git config --add` Is Not Idempotent Because It Duplicates Config](#git-config---add-is-not-idempotent-because-it-duplicates-config)
- [Desired State Reconciliation and the Power of Ansible](#desired-state-reconciliation-and-the-power-of-ansible)
- [Installing Ansible and the Installation Guide Docs](#installing-ansible-and-the-installation-guide-docs)
- [Updating Ansible via `pip` or Otherwise](#updating-ansible-via-pip-or-otherwise)
- [Leverage the Porting Guides](#leverage-the-porting-guides)
- [Know How to Know What You Need to Know as You Go](#know-how-to-know-what-you-need-to-know-as-you-go)
- [Why Installs and Even Updates Are Easy - Control Node Architecture](#why-installs-and-even-updates-are-easy---control-node-architecture)
- [The Ansible Ad-hoc Command](#the-ansible-ad-hoc-command)
- [Disseminating a `.gitconfig` with Ansible Ad-hoc and the Copy Module](#disseminating-a-gitconfig-with-ansible-ad-hoc-and-the-copy-module)
- [Understanding Idempotence with the Copy Module](#understanding-idempotence-with-the-copy-module)
- [How Ansible's Copy Module Handles Drift Thanks to Idempotence](#how-ansibles-copy-module-handles-drift-thanks-to-idempotence)
- [The `--check` Flag Simply Checks if Changes Would Be Made](#the---check-flag-simply-checks-if-changes-would-be-made)
- [The `--diff` Flag Shows What Will Change or Did Change](#the---diff-flag-shows-what-will-change-or-did-change)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Using the `git config` Command to Manually Configure User Name and Email

## A Repeatable Script to Automatically Configure Git with `user.name` and `user.email`

## `git config --add` Is Not Idempotent Because It Duplicates Config

## Desired State Reconciliation and the Power of Ansible

## Installing Ansible and the Installation Guide Docs

## Updating Ansible via `pip` or Otherwise

## Leverage the Porting Guides

## Know How to Know What You Need to Know as You Go

## Why Installs and Even Updates Are Easy - Control Node Architecture

## The Ansible Ad-hoc Command

## Disseminating a `.gitconfig` with Ansible Ad-hoc and the Copy Module

## Understanding Idempotence with the Copy Module

## How Ansible's Copy Module Handles Drift Thanks to Idempotence

## The `--check` Flag Simply Checks if Changes Would Be Made

## The `--diff` Flag Shows What Will Change or Did Change
