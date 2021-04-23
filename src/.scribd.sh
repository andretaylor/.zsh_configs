#-------------------------------------------------------------
# Environment variables
#-------------------------------------------------------------
export PATH="${PATH}:${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"
export readonly RAND=$(openssl rand -hex 10)

export readonly SCNP_DIR="${HOME}/Documents/scribd/git/npm-packages"
export readonly SCSC_DIR="${HOME}/Documents/scribd/git/scribd/scribd"
export readonly SCSC_DOCPAGE_DIR="${SCSC_DIR}/webpack/doc_page"
export readonly SCSC_MONOLITH_DIR="${SCSC_DIR}/webpack/monolith"
export readonly SCSC_END2END_DIR="${SCSC_DIR}/end2end"

#-------------------------------------------------------------
# Utilities
#-------------------------------------------------------------

# Log into Devkube pod
source ${ZSH_CONFIGS_DIR}/src/lib/devkube_exec_bash.sh

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
alias dkup="devkube init"                                     # Initialize devkube
alias dksh="devkube_exec_bash"                           # Log into a devkube pod; $1=`frontend`|`rails` - need to create a function
alias dknew="devkube init --cluster"                          # Create a new cluster
alias dkswap="devkube cluster set"                            # Switch to a different cluster
alias dkrm="devkube cluster delete"                           # Remove a cluster
alias dklist="devkube cluster list"                           # List current clusters

alias dkfw="devkube frontend watch"                           # Watch webpack for future builds
alias dklogs="devkube logs"                                   # devkube logs: Now shows logs for any services, not just rails.
alias dkstatus="devkube status"                               # devkube status: Now shows statuses for all services, not just rails.
alias dkrestart="devkube restart"                             # devkube restart: Now restarts any service, not just rails.

# Directories
alias scnp="cd $SCNP_DIR"
alias scsc="cd $SCSC_DIR"
alias scscd="cd $SCSC_DOCPAGE_DIR"
alias scscm="cd $SCSC_MONOLITH_DIR"
alias scsce="cd $SCSC_END2END_DIR"

# Miscellaneous
alias sbi="bundle install --full-index; yarn"       # Install latest gems and node_modules
alias ssb="launch_storybook"                        # Launch scribd storybook
alias stc="jest_test_coverage"                      # Jest test coverage
alias stw="yarn test:watch"                         # Jest test watch
alias stwa="yarn test:watch --watchAll"             # Jest test watch all
alias sms="mono_sync_with_devkube"                  # Sync Mono repository with devkube
alias swb="webpack_build"                           # Build application bundles
``