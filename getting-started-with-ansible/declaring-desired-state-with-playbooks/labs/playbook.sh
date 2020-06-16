#!/usr/bin/env bash

set -u pipefail

readonly FILE_PATH="/tmp/learning-ansible/.gitconfig"

set -x

rm -f "$FILE_PATH"
cat "$FILE_PATH"
echo

ansible-playbook playbook.yml
ansible-playbook playbook.yml

cat "$FILE_PATH"
