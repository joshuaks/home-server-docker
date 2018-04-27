#!/bin/bash 


set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
# set -x;                   # debug mode


# usually we'd use docker-compose, etc.
# but synology's base system is restrictive
# this gets a base container off the ground, with
# minimal work with the host, so all the real work can be done
# in the container
function main(){
    local -r container_name="base-$(date +%s)"
    docker run \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    --entrypoint=tail \
    --name="${container_name}" \
    --env DOCKER_API_VERSION=1.23 \
    -d \
    docker:18.04 \
    -f /dev/null

    docker exec -it "${container_name}" sh -c ' 
	apk update
	apk add curl git bash openssh vim
	curl -L --fail https://github.com/docker/compose/releases/download/1.21.0/run.sh -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	mkdir -p "${HOME}/.ssh"
	touch "${HOME}/.ssh/id_rsa"
    '

    echo "CONTAINER NAME: ${container_name}"
    echo 'automatically exec-ing into container'
    # just drop us right into this
    docker exec -it "${container_name}" bash
}
main

