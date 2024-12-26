export BASH_SILENCE_DEPRECATION_WARNING=1

# Opens current directory in MacOS Finder
alias f='open -a Finder ./'                 

# Paste Finder directory
function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# Paste Finder selection
function pfs() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count of the_selection
    repeat with item_index from 1 to count the_selection
      if item_index < item_count then
        set the_delimiter to linefeed
      else
        set the_delimiter to ""
      end if
      set output to output & (POSIX path of (item item_index of the_selection as alias)) & the_delimiter
    end repeat
    return output
EOF
}

# Change directory to the current Finder directory.
function cdf() {
  cd "$(pfd)"
}

# Push a Finder directory onto the stack of dirs
function pushdf() {
  pushd "$(pfd)"
}

# Opens any file in MacOS Quicklook Preview
ql () { qlmanage -p "$*" >& /dev/null; }

# Opens any file in MacOS Preview application
function mp() {
  man -t "$@" | open -f -a Preview
}
#compdef _man man-preview

function qa {
osascript <<EOF
  tell application "$*" to quit
EOF
}

alias q='pmset displaysleepnow'
alias dsclean='find . -type f -name .DS_Store -print0 | xargs -0 rm'

alias p=pbpaste
alias c=pbcopy
