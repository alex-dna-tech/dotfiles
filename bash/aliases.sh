if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source $HOME/dotfiles/bash/linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source $HOME/dotfiles/bash/macos.sh
fi

# source $HOME/dotfiles/bash/composer.sh
# source $HOME/dotfiles/bash/symfony.sh
# source $HOME/dotfiles/bash/qemu.sh
# source $HOME/dotfiles/bash/k8s.sh
source $HOME/dotfiles/bash/aider.sh
source $HOME/dotfiles/bash/ansible.sh
source $HOME/dotfiles/bash/common.sh
source $HOME/dotfiles/bash/docker.sh
source $HOME/dotfiles/bash/git.sh
source $HOME/dotfiles/bash/golang.sh
source $HOME/dotfiles/bash/history.sh
source $HOME/dotfiles/bash/nvm.sh
source $HOME/dotfiles/bash/obsidian.sh
source $HOME/dotfiles/bash/python.sh
source $HOME/dotfiles/bash/ssh.sh
source $HOME/dotfiles/bash/tmux.sh
source $HOME/dotfiles/fabric/fabric.sh
