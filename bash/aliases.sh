set -o vi
bind -m vi-insert "\C-l":clear-screen

alias  vim=nvim
export EDITOR=nvim
export VISUAL=nvim

PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\$\[\033[00m\] "
# PS1="\u@\h \W\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\\$\[$(tput sgr0)\] "

source $HOME/dotfiles/bash/linux.sh
source $HOME/dotfiles/bash/macos.sh
source $HOME/dotfiles/bash/history.sh
source $HOME/dotfiles/bash/common.sh
source $HOME/dotfiles/bash/docker.sh
source $HOME/dotfiles/bash/git.sh
source $HOME/dotfiles/bash/golang.sh
source $HOME/dotfiles/bash/composer.sh
source $HOME/dotfiles/bash/symfony.sh
source $HOME/dotfiles/bash/tmux.sh
source $HOME/dotfiles/bash/ansible.sh

