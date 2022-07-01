set -o vi
bind -m vi-insert "\C-l":clear-screen

export VISUAL=nvim
alias  vim=nvim

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

