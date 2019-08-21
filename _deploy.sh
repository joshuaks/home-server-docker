#!/usr/bin/env bash

# ENV SETTINGS ##########
set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe


# GLOBALS ###############
SCRIPT_DIRPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  ; declare -r SCRIPT_DIRPATH

declare -r PLAYBOOK_FILEPATH="${SCRIPT_DIRPATH}/deploy.yaml"
declare -r INVENTORY_FILEPATH="${SCRIPT_DIRPATH}/inventory.home.yaml"

echo "EXECUTING playbook at: '${PLAYBOOK_FILEPATH}'"
echo "USING inventory at: '${INVENTORY_FILEPATH}'"

ansible-playbook \
  --inventory "${INVENTORY_FILEPATH}" \
  "${PLAYBOOK_FILEPATH}"
