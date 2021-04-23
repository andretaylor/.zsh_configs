#!/bin/zsh

#-------------------------------------------------------------
# Shell Configuration Loader
#-------------------------------------------------------------
function load_shell() {
  unset local load_aliases load_environment load_scribd load_utilities load_zsh

  local -r FUNCTION_NAME=${funcstack[1]}

  # Config Files
  local -r ALIASES_CONFIG="${HOME}/.zsh_configs/src/.aliases.sh"
  local -r ENVIRONMENT_CONFIG="${HOME}/.zsh_configs/src/.environment.sh"
  local -r SCRIBD_CONFIG="${HOME}/.zsh_configs/src/.scribd.sh"
  local -r UTILITIES_CONFIG="${HOME}/.zsh_configs/src/.utilities.sh"
  local -r ZSH_CONFIG="${HOME}/.zsh_configs/src/.zsh"

  _examples() {
    echo
    echo "Run-time examples"
    echo "  ${FUNCTION_NAME}       : Load all scripts"
    echo "  ${FUNCTION_NAME} -a    : Reload ${ALIASES_CONFIG}"
    echo "  ${FUNCTION_NAME} -e -u : Reload ${ENVIRONMENT_CONFIG} and ${UTILITIES_CONFIG}"
    echo "  ${FUNCTION_NAME} -h    : Display run-time options and examples"
  }

  _options() {
    echo
    echo "Run-time usage options"
    echo "  [ -a ] : Reload ${ALIASES_CONFIG}"
    echo "  [ -e ] : Reload ${ENVIRONMENT_CONFIG}"
    echo "  [ -s ] : Reload ${SCRIBD_CONFIG}"
    echo "  [ -u ] : Reload ${UTILITIES_CONFIG}"
    echo "  [ -z ] : Reload ${ZSH_CONFIG}"
    echo "  [ -h ] : Help"
  }

  _print_help() {
    echo
    _options
    echo
    _examples
    echo
  }

  if ( ! getopts "aesuzh" opt ); then
    source ${ENVIRONMENT_CONFIG} &&
    source ${SCRIBD_CONFIG} &&
    source ${UTILITIES_CONFIG} &&
    source ${ZSH_CONFIG} &&
    # Load aliases last to overwrite default Oh My ZSH aliases
    source ${ALIASES_CONFIG}

    return
  fi

  while getopts "aesuzh" opt; do
    case $opt in
      a) load_aliases=1 ;;
      e) load_environment=1 ;;
      s) load_scribd=1 ;;
      u) load_utilities=1 ;;
      z) load_zsh=1 ;;
      h) _print_help
         return ;;
    esac
  done

  if [[ -n "${load_aliases}" ]]; then
    print_header "Reloading: ${ALIASES_CONFIG}"
    source ${ALIASES_CONFIG}
  fi

  if [[ -n "${load_environment}" ]]; then
    print_header "Reloading: ${ENVIRONMENT_CONFIG}"
    source ${ENVIRONMENT_CONFIG}
  fi

  if [[ -n "${load_scribd}" ]]; then
    print_header "Reloading: ${SCRIBD_CONFIG}"
    source ${SCRIBD_CONFIG}
  fi

  if [[ -n "${load_utilities}" ]]; then
    print_header "Reloading: ${UTILITIES_CONFIG}"
    source ${UTILITIES_CONFIG}
  fi

  if [[ -n "${load_zsh}" ]]; then
    print_header "Reloading: ${ZSH_CONFIG}"
    source ${ZSH_CONFIG}

    # Load aliases last to overwrite default Oh My ZSH aliases
    print_header "Reloading: ${ALIASES_CONFIG}"
    source ${ALIASES_CONFIG}
  fi
}

#-------------------------------------------------------------
# Load Shell
#-------------------------------------------------------------
load_shell
