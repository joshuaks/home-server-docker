#!/usr/bin/env bash

set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
# set -x;                   # debug mode



function build(){
  local -r build_dir="${1}"
  (  cd "${build_dir}" || exit 1
     local -r tag="$( basename "$(pwd)" )"
     docker build -t "${tag}:latest" .
  )
}

function builds(){
  local -r build_dirs="$( ls -d */ )"
  for build_dir in ${build_dirs}; do
    echo "BUILDING: ${build_dir}"
    build "${build_dir}"
    echo "COMPLETE: ${build_dir}"
    echo
  done
}

function main(){
  builds
}
main
