[ ! -f $HOME/.ssh/id_ed25519 ] && ssh-keygen -t ed25519 -C "edwinkamaumuraya0@outlook.com"

gh ssh-key add ~/.ssh/id_ed25519.pub  -t "SSHLogin-lab"
