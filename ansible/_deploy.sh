#!/usr/bin/env bash

set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
shopt -s failglob           # fail on regex expansion fail


SCRIPT_DIRPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  ; declare -r SCRIPT_DIRPATH

#export ANSIBLE_DEBUG=1

function main(){
  local -r inventory_path="${SCRIPT_DIRPATH}/inventory"
  ansible-playbook \
    deploy.yml
}
    #--inventory "${inventory_path}/home" \
main
