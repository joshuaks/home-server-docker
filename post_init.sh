#!/bin/bash 


set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
# set -x;                   # debug mode


function main(){
    chmod 400 "${HOME}"/.ssh/id_rsa
    git config --global user.email "me@joshua-sarver.com"
    git config --global user.name "Joshua Sarver"
    (    cd "${HOME}" || exit 1
         git clone git@github.com:joshuaks/home-server-docker.git
    )
}
main

