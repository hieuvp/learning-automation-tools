#!/usr/bin/env bash

set -u pipefail

readonly FILE_PATH="/tmp/learning-ansible/.gitconfig"

set -x

rm -f "$FILE_PATH"
printf "\n"

cat "$FILE_PATH"
printf "\n"

ansible-playbook playbook.yml
ansible-playbook playbook.yml

cat "$FILE_PATH"
