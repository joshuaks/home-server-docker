#!/usr/bin/env bash

set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
shopt -s failglob           # fail on regex expansion fail


SCRIPT_DIRPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  ; declare -r SCRIPT_DIRPATH

#export ANSIBLE_DEBUG=1

function main(){
  local -r inventory_path="${SCRIPT_DIRPATH}/inventory"

  (
    cd ./dockerfiles/ansible-playbook
    sudo docker build . -t my_ansible:latest
  )


    sudo docker run \
	--rm \
	--interactive \
	--tty \
	--network 'host' \
	--read-only \
	--cap-drop 'ALL' \
	--workdir "$(pwd)" \
	--volume "$(pwd):$(pwd):ro" \
	--volume '/var/run/docker.sock:/var/run/docker.sock:ro' \
	--tmpfs '/root/.ansible' \
	--tmpfs '/.ansible' \
	--tmpfs '/tmp' \
	my_ansible:latest \
	ansible-playbook ipados_deploy.yml 
	#--ask-become-pass
	#--network 'host' \
	#--volume '/tmp:/tmp' \
}
    #--inventory "${inventory_path}/home" \
main
