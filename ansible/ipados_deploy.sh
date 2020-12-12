#!/usr/bin/env bash

set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
shopt -s failglob           # fail on regex expansion fail


SCRIPT_DIRPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  ; declare -r SCRIPT_DIRPATH

#export ANSIBLE_DEBUG=1

function main(){
  local -r inventory_path="${SCRIPT_DIRPATH}/inventory"

  sudo docker build . -t my_ansible:latest

    sudo docker run \
	--rm \
	-it \
	--read-only \
	--cap-drop 'ALL' \
	-v $(pwd):/data:ro \
	-v /var/run/docker.sock:/var/run/docker.sock:ro \
	--tmpfs '/root/.ansible' \
	--tmpfs '/tmp' \
	--tmpfs '/.ansible' \
	my_ansible:latest \
	ansible-playbook ipados_deploy.yml 
	#--ask-become-pass
	#--network 'host' \
}
    #--inventory "${inventory_path}/home" \
main
