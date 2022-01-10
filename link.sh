#!/bin/sh
# rm ~/.zshrc
# ln -s ~/dotfiles/zshrc ~/.zshrc
#
# rm ~/.npmrc
# ln -s ~/dotfiles/npmrc ~/.npmrc

# 需要做软链的文件或文件夹
dotfiles=("zsh" "gitconfig" "zshrc" "npmrc" "SpaceVim.d" "tmux.conf" "ssh")

for dotfile in "${dotfiles[@]}"; do
  source="$HOME/dotfiles/$dotfile"
  target="$HOME/.$dotfile"

  if [[ -e "$target" ]]; then
    echo "start rm $target"
    rm $target
  fi

  if [[ -e "$source" ]]; then
    echo "start ln $source $target"
    ln -s $source $target
  fi

  chmod 600 $HOME/.ssh/id_rsa
done

# 需要软链的.config下文件夹
configs=("kitty")
for config in "${configs[@]}"; do
  if [[ -e "$HOME/.config/$config" ]]; then
    rm -rvf $HOME/.config$config/
  fi
  ln -s $HOME/dotfiles/$config $HOME/.config/$config
done

# SPACE VIM
SpaceVim="$HOME/dotfiles/SpaceVim/*"
for space in $SpaceVim
do
  if [[ -f "$space" ]]; then
    rm -rvf $space 
  fi

  echo "$(basename "$space")"

  ln -s $space $HOME/.SpaceVim/$(basename "$space")
done
