#!/bin/bash 

# ENV SETTINGS ##########
set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
# set -x;                   # debug mode

# GLOBALS ###############
declare -ra ARGS=("$@")

CALLING_DIRPATH="$(pwd)"; declare -r CALLING_DIRPATH
SCRIPT_FILENAME="$(basename "${0}")"; declare -r SCRIPT_FILENAME
SCRIPT_DIRPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; declare -r SCRIPT_DIRPATH
declare -r SCRIPT_FILEPATH="${SCRIPT_DIRPATH}/${SCRIPT_FILENAME}"



# MAIN ##################
function main(){
    echo 'pushing files to server'
    rsync \
        --rsh="ssh -i ${HOME}/.ssh/id_rsa" \
        --rsync-path='/bin/rsync' \
        --recursive \
        --password-file="${SCRIPT_DIRPATH}/keyfile_password" \
        "${SCRIPT_DIRPATH}" \
        '10.0.1.8':'${HOME}/docker'

    echo 'complete'
    exit 0
}
main




