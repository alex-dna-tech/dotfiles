if [[ -x "$(command -v git)" ]]; then
  export GIT_TERMINAL_PROMPT=1

  alias gco='git checkout'
  alias gcm='git checkout master'
  alias gc='git commit'
  alias ga='git add'
  alias gb='git branch -a'
  alias gl='git log --stat'
  alias glg='git log --graph --decorate --all'
  alias glo='git log --oneline --decorate'
  alias gst='git status'
  alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
  alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
  alias grom='git fetch origin && git reset --hard origin/master && git clean -f -d'
  alias grum='git fetch upstream && git reset --hard upstream/master && git clean -f -d'
  alias gt='git tag'
  alias gta='git tag -a'
  alias gtl='git tag -l'
  alias glch='git config --local credential.helper ""'
  gclun() { git config --local user.name "$1"; }
  gclue() { git config --local user.email "$1"; }
  gra() { git rebase -r ${1:-HEAD~1} --exec 'git commit --amend --no-edit --reset-author'; }
fi
