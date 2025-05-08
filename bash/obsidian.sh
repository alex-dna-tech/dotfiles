export OBSIDIAN_VAULTS_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
export OBSIDIAN_DEFAULT_VAULT="Trans"
export OBSIDIAN_DAILY_FOLDER="Calendar/Daily"

alias o='cd "$OBSIDIAN_VAULTS_DIR/$OBSIDIAN_DEFAULT_VAULT/Fabric"'

on(){
  dailyFile=$(date "+%Y-%m-%d").md
  cd "$OBSIDIAN_VAULTS_DIR/$OBSIDIAN_DEFAULT_VAULT/$OBSIDIAN_DAILY_FOLDER" || exit
  touch "${dailyFile}" && nvim "${dailyFile}"
}
alias ond='on'


