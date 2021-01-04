#!/bin/zsh

#-------------------------------------------------------------
# Webpack Build
#-------------------------------------------------------------
function webpack_build() {
  unset local build_all configuration environment

  local configuration_count=0
  local environment_count=0

  local -r FUNCTION_NAME=${funcstack[1]}

  _error_did_not_build() {
    echo "Error: Did not build"
  }

  _error_invalid_configuration() {
    echo "Error: Invalid CL configuration"
  }

  _error_invalid_options() {
    echo "Error: Invalid CL options"
  }

  _examples() {
    echo "Run-time examples"
    echo "       ${FUNCTION_NAME} -c -d : Client dev build"
    echo "       ${FUNCTION_NAME} -c -p : Client prod build"
    echo "       ${FUNCTION_NAME} -s -d : Server dev build"
    echo "       ${FUNCTION_NAME} -s -p : Server prod build"
    echo "       ${FUNCTION_NAME} -a    : Test build all"
  }

  _options() {
    echo "Run-time usage options"
    echo "       [ -c ] : Build using client configuration"
    echo "       [ -s ] : Build using server configuration"
    echo "       [ -d ] : Build for dev[elopment] environment"
    echo "       [ -p ] : Build for prod[uction] environment"
    echo "       [ -a ] : Test all webpack builds"
  }

  _print_error() {
    echo
    _error_did_not_build
    _error_invalid_configuration
    echo
    _options
    echo
    _examples
    echo
  }

  _print_invalid_options() {
    echo
    _error_did_not_build
    _error_invalid_options
    echo
    _options
    echo
    _examples
    echo
  }

  if ( ! getopts "acdhps" opt ); then
    _print_invalid_options

    return
  fi

  while getopts "acdhps" opt; do
    case $opt in
      a) build_all=1 ;;
      c) configuration="client"
         (( configuration_count+=1 )) ;;
      d) environment="dev"
         (( environment_count+=1 )) ;;
      p) environment="prod"
         (( environment_count+=1 )) ;;
      s) configuration="server"
         (( configuration_count+=1 )) ;;
      h) _print_help
         return ;;
    esac
  done


  if [[ $configuration_count > 1 ]] || [[ $environment_count > 1 ]]; then
    _print_invalid_options
  elif [[ -n "${build_all}" ]] && [[ -z "${configuration}" ]] && [[ -z "${environment}" ]]; then
    print_header "Client Dev Build"
    ${FUNCTION_NAME} -c -d
    print_header "Client Prod Build"
    ${FUNCTION_NAME} -c -p
    print_header "Server Dev Build"
    ${FUNCTION_NAME} -s -d
    print_header "Server Prod Build"
    ${FUNCTION_NAME} -s -p
  elif [[ -n "${configuration}" ]] && [[ -n "${environment}" ]]; then
    yarn build:${configuration}:${environment}
  else
    _print_error
  fi
}
