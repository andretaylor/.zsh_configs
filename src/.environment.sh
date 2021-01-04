#-------------------------------------------------------------
# Environmental variables
#-------------------------------------------------------------
export PATH="${PATH}:${HOME}:${HOME}/bin:/usr/local/bin:${HOME}/Library"
export readonly ZSH_CONFIGS_DIR="${HOME}/.zsh_configs"

#-------------------------------------------------------------
# NVM environmental variables
#-------------------------------------------------------------
export readonly NVM_DIR="${HOME}/.nvm"

# Load NVM
if [[ -s "${NVM_DIR}/nvm.sh" ]]; then
 source "${NVM_DIR}/nvm.sh"
fi

# Load NVM bash_completion
if [[ -s "${NVM_DIR}/bash_completion" ]]; then
  source "${NVM_DIR}/bash_completion"
fi

#-------------------------------------------------------------
# Ruby environmental variables
#-------------------------------------------------------------
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby  ruby-2.4.7
