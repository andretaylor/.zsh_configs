#!/bin/zsh

#-------------------------------------------------------------
# Jest Test Coverage
#-------------------------------------------------------------
function jest_test_coverage() {
  unset local test_docpage test_npm_packages test_monolith

  local -r FUNCTION_NAME=${funcstack[1]}
  local -r REPORT_FILE="/coverage/index.html"

  _error_invalid_configuration() {
    echo "Error: Invalid CL configuration"
  }

  _error_invalid_options() {
    echo "Error: Invalid CL options"
  }

  _error_test_coverage() {
    echo "Error: Test coverage not run"
  }

  _examples() {
    echo "Run-time examples"
    echo "       ${FUNCTION_NAME} -d : Run coverage on Scribd repository, doc_page app"
  }

  _options () {
    echo "Run-time usage options"
    echo "       [ -d ] : Run coverage on Scribd repository, doc_page app"
    echo "       [ -n ] : Run coverage on npm_packages repository"
    echo "       [ -m ] : Run coverage on Scribd repository, test_monolith app"
  }

  _print_error () {
    echo
    _error_test_coverage
    _error_invalid_configuration
    echo
    _options
    echo
    _examples
    echo
  }

  _print_help () {
    echo
    _options
    echo
    _examples
    echo
  }

  if ( ! getopts "omdh" opt ); then
    _print_error
    return
  fi

  while getopts "dnmh" opt; do
    case $opt in
      d) test_docpage=1 ;;
      n) test_npm_packages=1 ;;
      m) test_monolith=1 ;;
      h) _print_help
         return ;;
    esac
  done

  if [[ -n "${test_npm_packages}" ]]; then
    print_header "Run coverage on Mono repository"
    # Change directory to mono app root
    scnp
    yarn test:coverage; open .${REPORT_FILE}
  fi

  if [[ -n "${test_docpage}" ]]; then
    print_header "Run coverage on Scribd repository; doc_page app"
    # Change directory to docpage app root
    scscd
    yarn test:coverage; open .${REPORT_FILE}
  fi

  if [[ -n "${test_monolith}" ]]; then
    print_header "Run coverage on Scribd repository; test_monolith app"
    # Change directory to monolith app root
    scscm
    yarn test:coverage; open ./../..${REPORT_FILE}
  fi
}
