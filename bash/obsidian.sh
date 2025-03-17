OBSIDIAN_VAULTS_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
OBSIDIAN_DEFAULT_VAULT="Trans"
OBSIDIAN_DAILY_FOLDER="Calendar/Daily"

alias t='cd "$OBSIDIAN_VAULTS_DIR/$OBSIDIAN_DEFAULT_VAULT/Fabric"'

on(){
  dailyFile=$(date "+%Y-%m-%d").md
  cd "$OBSIDIAN_VAULTS_DIR/$OBSIDIAN_DEFAULT_VAULT/$OBSIDIAN_DAILY_FOLDER" || exit
  touch "${dailyFile}" && nvim "${dailyFile}"
}
