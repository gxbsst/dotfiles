#!/usr/bin/env bash

set -x
set -e

TOOLS=(wget bat lsd exa rip xcp zoxide dust ripgrep fd sd procs bottom topgrade broot tokei tmuxinator lazygit zurawiki/brews/gptcommit btop fzf tldr)
MAX_RETRY=3
RETRY=0

# 安装工具函数
install_tool() {
    tool=$1
    echo "Installing $tool"
    brew install $tool 2>&1 | tee -a install_tools.log
    if [ $? -eq 0 ]; then
        echo "Successfully installed $tool"
    else
        echo "Failed to install $tool"
    fi
}

# 遍历安装工具
for tool in ${TOOLS[@]}; do 
  # RETRY=0
  # while [ $RETRY -lt $MAX_RETRY ]; do
    install_tool $tool
    # if [ $? -eq 0 ]; then
    #     break
    # fi
    # RETRY=$((RETRY+1))
    # echo "Retry #$RETRY for $tool"
  done
done

