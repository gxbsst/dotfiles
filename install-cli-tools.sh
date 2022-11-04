#!/usr/bin/env bash
#
# https://deepu.tech/rust-terminal-tools-linux-mac-windows-fish-zsh/
TOOLS=(bat lsd exa rip xcp zoxide dust ripgrep fd sd procs bottom topgrade broot tokei)

for tool in ${TOOLS[@]}; do 
  brew install $tool
done
