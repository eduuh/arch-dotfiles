#!/bin/bash

# set up my environment
# creating a hard link to my hosts.config file

renaming_possibleconflicts() {
  ## delete .config:  cache : delete if successful
  [ -d $HOME/.config ]    &&  mv $HOME/.config $HOME/.config.bak
  [ -d $HOME/.local/bin ] &&  mv $HOME/.local/bin $HOME/.local/bin.bak
  [ -d $HOME/.vsnip ] &&  mv $HOME/.vsnip $HOME/.vsnip.bak
  test -f $HOME/.gitconfig && mv $HOME/.gitconfig $HOME/.gitconfig.bak
  test -f $HOME/.tmux.conf && mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
  test -f $HOME/.xprofile  && mv $HOME/.xprofile $HOME/.xprofile.bak
  test -f $HOME/.xprofile  && mv $HOME/.xprofile $HOME/.xprofile.bak
  test -f $HOME/etc/hosts  && mv $HOME/etc/hosts $HOME/etc/hosts.bak
}

# This files will be recreated
remove_nonissuefiles() {
    rm $HOME/.xprofile
    [ -f $HOME/.setup.sh ] && rm $HOME/.setup.sh
    [ -f $HOME/Dockerfile ] && rm $HOME/Dockerfile
    [ -f $HOME/readme.md ] && rm $HOME/readme.md
    [ -f $HOME/.gitignore ] && rm $HOME/.gitignore
}

remove_backupfiles() {
    [ -d $HOME/.config.bak ] && rm -rf $HOME/.config.bak 
    [ -d $HOME/.local/bin.bak ] && rm  -rf $HOME/.local/bin.bak 
    [ -d $HOME/.vsnip.bak ] &&  rm -rf $HOME/.vsnip.bak
    [ -d $HOME/.github ] &&  rm -rf $HOME/.github
    [ -f $HOME/.gitconfig.bak ] && rm $HOME/.gitconfig.bak
    [ -f $HOME/.tmux.COnf.bak ] && rm $HOME/.tmux.conf.bak
    [ -f $HOME/.xprofile.bak ]  && rm $HOME/.xprofile.bak
    [ -f $HOME/.xprofile.bak ]  && rm $HOME/.xprofile.bak
    [ -f $HOME/etc/hosts.bak ] && rm $HOME/etc/hosts.bak
}


set_updotfilesfolder() {
      [ -d $HOME/.dotfiles ] && rm -rf $HOME/.dotfiles
      git init --bare $HOME/.dotfiles  
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -b main
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME remote add origin https://github.com/eduuh/dotfiles.git
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME branch --set-upstream-to=origin/main main
           
       remove_backupfiles
       remove_nonissuefiles
       renaming_possibleconflicts
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull origin main
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
    }




set_updotfilesfolder
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
echo ".dotfiles" >> .gitignore

# create a link to my hostfile
#ln .config/hosts /etc/hosts
remove_backupfiles
