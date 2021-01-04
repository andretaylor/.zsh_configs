#!/bin/zsh

#-------------------------------------------------------------
# Launch storybook
#-------------------------------------------------------------
function launch_storybook() {
  unset local run_in_monolith_app

  local -r FUNCTION_NAME=${funcstack[1]}
  local -r RUN_STORYBOOK=(yarn storybook)

  _examples() {
    echo "Run-time examples"
    echo "       ${FUNCTION_NAME}    : Launches storybook in current app if available"
    echo "       ${FUNCTION_NAME} -m : Launches storybook for monolith app"
  }

  _options () {
    echo "Run-time usage options"
    echo "       [ -m ] : Run coverage on Scribd repository, is_monolith app"
  }

  _print_help () {
    echo
    _options
    echo
    _examples
    echo
  }

  while getopts "mh" opt; do
    case $opt in
      m) run_in_monolith_app=1 ;;
      h) _print_help
         return ;;
    esac
  done

  if [[ -n "$run_in_monolith_app" ]]; then
    # Change directory to monolith application root
    scsc
  fi

  ${RUN_STORYBOOK}
}
