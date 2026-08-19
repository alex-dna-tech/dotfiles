#!/bin/sh

CACHE_DIR="${HOME}/.cache/dmenu-scripts"
GLYPH_FILE="${CACHE_DIR}/glyph-list.txt"

mkdir -p "$CACHE_DIR"

if [ ! -e "$GLYPH_FILE" ]; then
    curl -s https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/glyphnames.json \
        | sed 's/},/}\n/g' \
        | grep '"char"' \
        | sed 's/^"\([^"]*\)":{"char":"\([^"]*\)".*/\1 \2/' \
        > "$GLYPH_FILE"
fi

chosen=$(dmenu -i -l 30 < "$GLYPH_FILE" | cut -d ' ' -f2)
[ -z "$chosen" ] && exit

if [ -n "$1" ]; then
    xdotool type "$chosen"
else
    printf '%s' "$chosen" | xclip -selection clipboard
    notify-send "'$chosen' copied to clipboard." &
fi
