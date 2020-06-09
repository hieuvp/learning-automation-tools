# Ad-Hoc Configuration with Idempotent Modules

<div align="center"><img src="assets/scenario-progression.png" width="900"></div>

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
