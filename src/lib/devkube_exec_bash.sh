#!/bin/zsh
#-------------------------------------------------------------
# Log into a Devkube pod
#-------------------------------------------------------------
function devkube_exec_bash() {
  if [[ -n "${1}" == "rails" ]]; then
    devkube exec rails bash
  else
    devkube exec frontend bash
  fi
}