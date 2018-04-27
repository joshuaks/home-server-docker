#!/bin/bash 


set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
# set -x;                   # debug mode


function main(){
    docker run \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    --entrypoint=tail \
    -d \
    docker:18.04 \
    -f /dev/null
}
main

