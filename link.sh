#!/bin/sh
# rm ~/.zshrc
# ln -s ~/dotfiles/zshrc ~/.zshrc
#
# rm ~/.npmrc
# ln -s ~/dotfiles/npmrc ~/.npmrc

dotfiles=("zshrc" "npmrc" "SpaceVim.d")

for dotfile in "${dotfiles[@]}"; do
  source="$HOME/dotfiles/$dotfile"
  target="$HOME/.$dotfile"
  echo "source $source" 
  echo "target $target" 

  if [[ -e "$target" ]]; then
    echo 'rm...'
    rm $target
  fi
  if [[ -e "$source" ]]; then
    echo 'ln...'
    ln -s $source $target
  fi
done

