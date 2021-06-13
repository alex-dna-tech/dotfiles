export GIT_TERMINAL_PROMPT=1
function ahead_behind () {
    curr_branch=$(git rev-parse --abbrev-ref HEAD);
    curr_remote=$(git config branch.$curr_branch.remote);
    curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
    git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | tr -s '\t' '|';
}
alias gco='git checkout'
alias gcm='git checkout master'
alias gc='git commit'
alias ga='git add'
alias gb='git branch'
alias gl='git log --stat'
alias glg='git log --graph --decorate --all'
alias glo='git log --oneline --decorate'
alias gst='git status'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gro='git fetch origin && git reset --hard origin/master && git clean -f -d'
alias gru='git fetch upstream && git reset --hard upstream/master && git clean -f -d'
