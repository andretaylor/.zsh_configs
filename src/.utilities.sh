#!/bin/zsh

#-------------------------------------------------------------
# String Utilities
#-------------------------------------------------------------

# Output Unique Date String
function date_string() {
  echo "$(date +%m%d%Y-%H%M%S)";
}

# Print Ascii Header
function print_header() {
  if [[ -z "${1}" ]]; then
    echo
    echo "Error: Header text missing."
    echo "Example: ${funcstack[1]} \"header name\""
    echo
    return
  fi

  local -r STRING_LENGTH=$(($(echo -n $1 | wc -m) + 4 ))

  _separator() {
    echo "${$( printf "%${STRING_LENGTH}s" )// /-}"
  }

  _separator
  echo "| ${1} |"
  _separator
}

#-------------------------------------------------------------
# Filesystem Utilities
#-------------------------------------------------------------

# Create A ZIP Archive
function make_zip() {
  zip -r "${1%%/}.zip" "$1";
}

# Display Directory As Tree View
function tree_view() {
  ls -R \
    | grep ":$" \
    | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
}

#-------------------------------------------------------------
# System Utilities
#-------------------------------------------------------------

# General System Info
function ii() {
  clear
  echo
  echo "${fg[yellow]}Current date:${reset_color} " ; date
  echo "${fg[yellow]}Machine stats:${reset_color} " ; uptime
  echo "${fg[yellow]}Memory stats:${reset_color} " ; top -l 1 \
    | head -n 10 \
    | grep PhysMem
  echo "${fg[yellow]}Disk space:${reset_color} " ; df /
  echo "${fg[yellow]}External IP:${reset_color} "; dig +short myip.opendns.com @resolver1.opendns.com
  echo "${fg[yellow]}Internal IP(s):${reset_color} " ; ifconfig \
    | grep 'inet ' \
    | grep -v 127.0.0.1 \
    | cut -d: -f2 \
    | awk '{print $2}'
  echo "${fg[yellow]}Name servers:${reset_color} " ; cat /etc/resolv.conf | grep nameserver
  echo "${fg[yellow]}Internet speed test: ${reset_color}" ; curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip
  echo
}

# Show My Processes
function myps() {
  ps $@ -u $USER -o pid,%cpu,%mem,command;
}

#-------------------------------------------------------------
# GIT Utilities
#-------------------------------------------------------------

source ${ZSH_CONFIGS_DIR}/src/lib/git_utilities.sh
