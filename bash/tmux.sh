alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

tmux has-session 2> /dev/null
if [ $? -ne 0 ]; then
  TMUX='' tmux new-session -s $(basename ${PWD})
else
  [ -z "$TMUX" ] && [ -z "$MYVIMRC" ] && tmux attach
fi

