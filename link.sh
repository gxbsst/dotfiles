#!/bin/sh
# rm ~/.zshrc
# ln -s ~/dotfiles/zshrc ~/.zshrc
#
# rm ~/.npmrc
# ln -s ~/dotfiles/npmrc ~/.npmrc

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

if [[ -e "$HOME/.config/kitty" ]]; then
  rm -rvf $HOME/.config/kitty
fi

ln -s $HOME/dotfiles/kitty $HOME/.config/kitty 

