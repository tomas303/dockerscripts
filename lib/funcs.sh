#!/bin/bash

################################################################################
# install <extension id>
# install extension into vscode
# f.e.: install_extension "aaron-bond.better-comments"
################################################################################

function install_extension()
{
  local extname=$1
  local test=$(code --list-extensions | sed -n -e "/$extname/p")
  if [[ -z "$test" ]]; then
     code --force --verbose --install-extension="$extname"
  fi
}

################################################################################
# install_vscode_extensions
# install default vscode extensions, does nothing in containers without vscode
################################################################################

function install_vscode_extensions()
{
  if ! command -v code > /dev/null; then
    return 0
  fi
  install_extension "alefragnani.numbered-bookmarks"
  install_extension "task.vscode-task"
}

################################################################################
# set_container_prompt
# add prompt showing container id into ~/.bashrc (once)
################################################################################

function set_container_prompt()
{
  if grep -q 'CONTAINER_ID' "$HOME/.bashrc"; then
    return 0
  fi
  echo "setting container id prompt"
  cat << 'EOF' >> ~/.bashrc

# container aware prompt
PS1='\[\033[01;32m\]\u@${CONTAINER_ID:-container}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF
}

################################################################################
# set_git_identity
# set global git user.name/user.email unless already configured
# values can be overridden by GIT_USER_NAME / GIT_USER_EMAIL env variables
################################################################################

function set_git_identity()
{
  local name="${GIT_USER_NAME:-tomash}"
  local email="${GIT_USER_EMAIL:-tomashorak@post.cz}"
  if [[ -z "$(git config --global user.name)" ]]; then
    git config --global user.name "$name"
  fi
  if [[ -z "$(git config --global user.email)" ]]; then
    git config --global user.email "$email"
  fi
}
