if [[ -x "$(command -v tmux)" ]]; then
  function t {
    if [[ -z $1 ]]; then
      tmux has-session 2> /dev/null
      if [ $? -ne 0 ]; then
        TMUX='' tmux new-session -s $(basename ${PWD})
      else
        [ -z "$TMUX" ] && [ -z "$MYVIMRC" ] && exec tmux attach
      fi
    fi
    exec tmux new-session -s "$1"
  }

  function tp {
    local name="${1:-$(basename "$PWD")}"
    exec tmux new-session -s "$name"
  }

  function ta {
    local name="${1:-$(basename "$USER")}"
    tmux attach -t $name
  }

  function tad {
    local name="${1:-$(basename "$USER")}"
    tmux attach -d -t $name
  }

  alias tl='tmux list-sessions'
  alias tksv='tmux kill-server'
  alias tkss='tmux kill-session -t'
fi
