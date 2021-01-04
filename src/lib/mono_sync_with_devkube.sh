#!/bin/zsh

#-------------------------------------------------------------
# Sync Mono Repository With Devkube
#-------------------------------------------------------------
function mono_sync_with_devkube() {
  local -r CONFIG_YAML="${HOME}/.devkube/devkube_config_custom.yaml"

  # Switch between enabled and disabled
  if [[ -f "${CONFIG_YAML}" ]]; then
    print_header "Mono sync disabled"
    mv ${CONFIG_YAML}{,.disabled}
  else
    print_header "Mono sync enabled"
    mv ${CONFIG_YAML}{.disabled,}
  fi
}