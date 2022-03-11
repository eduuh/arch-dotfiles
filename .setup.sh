#!/bin/bash

# set up my environment
# creating a hard link to my hosts.config file

git init --bare $HOME/.dotfiles  
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles remote add origin https://github.com/eduuh/dotfiles.git
dotfiles branch --set-upstream-to=origin/main main

## delete .config:  cache : delete if successful
mv ~/.config ~/.config.bak
mv ~/.local/bin ~/.local/bin.bak
mv .gitconfig .gitconfig.bak
mv .tmux.conf .tmux.conf
mv .xprofile  .xprofile.bak
mv ~/.vsnip/ ~/.vsnip.bak

dotfiles checkout

echo ".dotfiles" >> .gitignore

dotfiles config --local status.showUntrackedFiles no

sudo mv /etc/hosts /etc/hosts.bak
sudo ln .config/hosts /etc/hosts
