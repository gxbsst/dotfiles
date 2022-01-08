#!/bin/sh
# rm ~/.zshrc
# ln -s ~/dotfiles/zshrc ~/.zshrc
#
# rm ~/.npmrc
# ln -s ~/dotfiles/npmrc ~/.npmrc

dotfiles=("zshrc" "npmrc")

for dotfile in "${dotfiles[@]}"; do
  source="~/dotfiles/$dotfile"
  target="~/.$dotfile"
  echo "source $source" 
  echo "target $target" 

  if [[ -e "$target" ]]; then
    rm $target
  fi
  if [[ -e "$source" ]]; then
    ln -s "$source $target"
  fi
done

