#!/usr/bin/env bash

set -u pipefail

readonly ROOT_DIR="/tmp/learning-ansible"
readonly FILENAME=".gitconfig"
readonly FILEPATH="${ROOT_DIR}/${FILENAME}"

set -x

rm -rf "$ROOT_DIR"
cat "$FILEPATH"
echo

ansible-playbook playbook.yml
ansible-playbook playbook.yml

cat "$FILEPATH"
