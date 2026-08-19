#!/bin/sh

CACHE_DIR="${HOME}/.cache/dmenu-scripts"
GLYPH_FILE="${CACHE_DIR}/glyph-list.txt"

mkdir -p "$CACHE_DIR"

# Get user selection via dmenu from emoji file.
if [ -e "$GLYPH_FILE" ]
then
    chosen=$(cut -d ';' -f1 "$GLYPH_FILE" | dmenu -i -l 30 | sed "s/ .*//")
else
    echo -en "$(curl https://www.nerdfonts.com/cheat-sheet \
        | grep 'class="class-name">' \
        | sed 's/ *<div class="class-name">//; s/<\/div><div class="codepoint">/ \\u/; s/<\/div>//; s/\(.* \)\(.*\)/\2 \1/' \
        )" > "$GLYPH_FILE"
    chosen=$(cut -d ';' -f1 "$GLYPH_FILE" | dmenu -i -l 30 | sed "s/ .*//")
fi

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	printf "$chosen" | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard." &
fi
