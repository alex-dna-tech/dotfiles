lazy_load_nvm() {
  unset -f node nvm npm npx
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion" 
}

npm() {
  lazy_load_nvm
  command npm "$@"
}

npx() {
  lazy_load_nvm
  command npx "$@"
}

node() {
  lazy_load_nvm
  command node "$@"
}

nvm() {
  lazy_load_nvm
  nvm "$@"
}

if [[ -x "$(command -v nvim)" ]]; then
  v() {
    lazy_load_nvm
    command nvim "$@"
  }
fi

