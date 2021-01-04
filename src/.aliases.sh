#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Filesystem operations
alias cp="cp -iR"                                           # Copy directory entries. Prompt for confirmation, recursive
alias df="df -kh"                                           # Displays free disk space
alias du="du -kh"                                           # Displays disk usage stats in more readable output
alias filetree="tree_view"                                  # Display directory contents in a tree view
alias mv="mv -i"                                            # Move directory entries. Prompt for confirmation.
alias path="echo -e ${PATH//:/\\\n}"                        # Pretty-print of some PATH variables:
alias rm="rm -i"                                            # Remove directory entries. Ask for confirmation
alias rmff="rm -Rf"                                         # Remove directory entries. Recursive, force
alias which="type -a"                                       # Locate a program in user path. List all

# Shell
alias c="clear"                                             # Clear screen
alias hh="history"                                          # CL history
alias reload="load_shell"                                   # Reload shell

# List
alias lk="ll -Sr"                                           # Sort by size, biggest last.
alias lt="ll -tr"                                           # Sort by date, most recent last.
alias lc="ll -tcr"                                          # Sort by/show change time,most recent last.
alias lu="ll -tur"                                          # Sort by/show access time,most recent last.

#-------------------------------------------------------------
# GIT aliases
#-------------------------------------------------------------
# alias lgit="" # List GIT plugin aliases
alias lgits="git_cl_symbols"                                 # List GIT CL symbols

# Branch
alias gbm="git branch --merged"                              # List branches whose tips are reachable from HEAD
alias gbn="git_create_local_and_remote_branch"               # Create branch and push to origin
alias ggff="git push --force-with-lease"                     # Protect all remote refs that are going to be updated
alias ggpu="git push"                                        # Push changes to remote
alias gcor="git checkout -- ."                               # Remove unstaged files

# Housekeeping
alias gkbleach="git_remove_local_branches_if_not_on_remote"
alias gkdf="git branch --delete --force"                     # Remove local branch with force
alias gkdr="git push origin --delete"                        # Remove remote branch
alias gkclean="git_prune_and_clean_local_repository"
alias gkwipe="git_delete_remote_and_local_branch"

# Stash
alias gsta="git stash push"                                  # Push into stash

# Status
alias gsso="git show --stat --oneline"                       # Show status of files in HEAD or SHA
