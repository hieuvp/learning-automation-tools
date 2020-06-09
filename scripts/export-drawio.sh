#!/usr/bin/env bash

args=("$@")
set -eou pipefail

# shellcheck disable=SC1090
source "${HELPER_SCRIPT_PATH}/init.sh"

readonly FILE_PATH="${args[0]}"
readonly SCALE_SIZE="${args[1]}"
readonly BORDER_SIZE="${args[2]:=5}"

set -x

draw.io --export --format png \
  --scale "$SCALE_SIZE" \
  --border "$BORDER_SIZE" \
  --embed-diagram \
  "$FILE_PATH"
