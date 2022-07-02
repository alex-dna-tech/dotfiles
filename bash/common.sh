alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
md() { mkdir -p "$1" && cd "$1"; }          # md: Makes new Dir and jumps inside
alias less='less -FSRXc'
alias du='du -h'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias h='history'
alias hg='history | grep -i'
alias ag='alias | grep -i'
alias dirarch='find . -maxdepth 1 -type d ! -name . -exec tar -zcvf '{}'.tar.gz '{}'/ \; -exec rm -rf '{}' \;'


bind 'set completion-ignore-case on'

tmux has-session 2> /dev/null
if [[ $? -ne 0 ]]; then
  TMUX='' tmux new-session -d 
fi
if [[ -z "$TMUX" ]]; then
  tmux attach 
else
  tmux switch-client 
fi

PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\$\[\033[00m\] "
# PS1="\u@\h \W\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\\$\[$(tput sgr0)\] "
