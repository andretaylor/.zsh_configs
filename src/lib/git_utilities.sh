#!/bin/zsh

#-------------------------------------------------------------
# GIT Utilities
#-------------------------------------------------------------

# Backup current branch locally and remote
function git_backup_current_branch() {
  local -r BRANCH_NAME=$(current_branch)--backup-$(date_string)

  git checkout -b ${BRANCH_NAME} &&
  git push origin ${BRANCH_NAME} &&
  git push --set-upstream origin ${BRANCH_NAME}
}

# Print list of GIT CL prompt symbols
function git_cl_symbols () {
  echo
  echo "     ___________________________________________________________"
  echo "     | Symbol |  Meaning                                       |"
  echo "     -----------------------------------------------------------"
  echo "     | ⇣42    |  This many commits behind the remote           |"
  echo "     | ⇡42    |  This many commits ahead of the remote         |"
  echo "     | ⇠42    |  This many commits behind the push remote      |"
  echo "     | ⇢42    |  This many commits ahead of the push remote    |"
  echo "     | *42    |  This many stashes                             |"
  echo "     | merge  |  Repository state                              |"
  echo "     | ~42    |  This many merge conflicts                     |"
  echo "     | +42    |  This many staged changes                      |"
  echo "     | !42    |  This many unstaged changes                    |"
  echo "     | ?42    |  This many untracked files                     |"
  echo "     -----------------------------------------------------------"
  echo
}

# Create local and remote branch
function git_create_local_and_remote_branch() {
  if [[ -n "${1}" ]]; then
    git checkout -b ${1} &&
    git push origin ${1} &&
    git push --set-upstream origin ${1}
  else
    echo "Error: Branch name needed"
  fi
}

# Check if branch exist on remote
function git_check_exist_on_remote() {
    local existed_in_remote=$(git ls-remote --heads origin ${1})

    if [[ -z ${existed_in_remote} ]]; then
        echo 0
    else
        echo 1
    fi
}

# Delete remote & local branch
function git_delete_remote_and_local_branch() {
  if [[ -n "${1}" ]]; then
    git push origin --delete ${1} &&
    git branch -D ${1}
  else
    echo "Error: Branch name needed"
  fi
}

# Prune all unreachable objects from the object database
# Cleanup unnecessary files and optimize the local repository
function git_prune_and_clean_local_repository() {
  local main_branch=$(git branch | grep -o -m1 "\(master\|main\)")

  git checkout "${main_branch}" &&
  git pull &&
  git remote prune origin &&
  git gc
}

# Remove local branches if they do not exist on remote
function git_remove_local_branches_if_not_on_remote() {
  local main_branch=$(git branch | grep -o -m1 "\(master\|main\)")

  git checkout "${main_branch}" &&
  git pull &&
  git remote prune origin &&
  git branch --merged \
    | egrep -v "(^\*|master|main|dev)" \
    | xargs git branch -d origin/
}
