#-------------------------------------------------------------
# ENV variables
#-------------------------------------------------------------
export PATH="${PATH}:${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"
export readonly RAND=$(openssl rand -hex 10)

export readonly SCMO_DIR="${HOME}/Documents/scribd/git/mono"
export readonly SCSC_DIR="${HOME}/Documents/scribd/git/scribd/scribd"
export readonly SCSC_DOCPAGE_DIR="${SCSC_DIR}/webpack/doc_page"
export readonly SCSC_MONOLITH_DIR="${SCSC_DIR}/webpack/monolith"

#-------------------------------------------------------------
# Utilities
#-------------------------------------------------------------

# Jest test coverage
source ${ZSH_CONFIGS_DIR}/src/lib/jest_test_coverage.sh

# Launch storybook
source ${ZSH_CONFIGS_DIR}/src/lib/launch_storybook.sh

# Sync mono repository with devkube
source ${ZSH_CONFIGS_DIR}/src/lib/mono_sync_with_devkube.sh

# Webpack Build
source ${ZSH_CONFIGS_DIR}/src/lib/webpack_build.sh

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Devkube
alias dkup="ASSETS_MODE=build_dev devkube init"
alias dkfe="devkube exec ${1} bash"             # Log into a devkube pod; $1=`frontend`|`rails`
alias dknew="ASSETS_MODE=build_dev devkube init --cluster"
alias dkswap="devkube cluster set"

# Directories
alias scmo="cd $SCMO_DIR"
alias scsc="cd $SCSC_DIR"
alias scscd="cd $SCSC_DOCPAGE_DIR"
alias scscm="cd $SCSC_MONOLITH_DIR"

# Miscellaneous
alias sbi="bundle install --full-index; yarn"       # Install latest gems and node_modules
alias ssb="launch_storybook"                        # Launch scribd storybook
alias stc="jest_test_coverage"                      # Jest test coverage
alias stw="yarn test:watch"                         # Jest test watch
alias sms="mono_sync_with_devkube"
alias swb="webpack_build"
