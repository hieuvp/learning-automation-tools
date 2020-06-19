#!/usr/bin/env bash

set -u pipefail

readonly ROOT_DIR="/tmp/learning-ansible"
readonly FILENAME=".gitconfig"

set -x

rm -rf "$ROOT_DIR"
cat "${ROOT_DIR}/${FILENAME}"
echo

ansible-playbook playbook.yml
ansible-playbook playbook.yml

cat "$FILE_PATH"
