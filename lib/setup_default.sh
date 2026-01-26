#!/bin/bash


# prompt to show container id, EOF marks so called heredoc
if ! grep -q 'CONTAINER_ID' "$HOME/.bashrc"; then
echo "setting container id prompt"
cat << 'EOF' >> ~/.bashrc

# container aware prompt
PS1='\[\033[01;32m\]\u@${CONTAINER_ID:-container}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF
fi

install_extension "GitHub.copilot-chat"
install_extension "alefragnani.numbered-bookmarks"
install_extension "task.vscode-task"
