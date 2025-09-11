alias mh='pandoc -f markdown -t html'
alias hm='html2markdown'
alias www='go-readability'
alias fb='fabric'
alias fbu='fabric -g=uk'


fabric_update(){
go install github.com/danielmiessler/fabric/cmd/fabric@latest
go install github.com/danielmiessler/fabric/cmd/code_helper@latest
go install github.com/danielmiessler/fabric/cmd/generate_changelog@latest
go install github.com/JohannesKaufmann/html-to-markdown/v2/cli/html2markdown@latest
go install github.com/go-shiori/go-readability/cmd/go-readability@latest
curl -fsSL https://raw.githubusercontent.com/danielmiessler/Fabric/refs/heads/main/completions/setup-completions.sh | sh
}

ytwe(){
if [[ -z $1 ]]; then
  echo "You must set Youtube URL as argument"
  exit 1 
fi

META=$(fabric --youtube="$1" --metadata)

# POSIX compatible
# TITLE=$(printf '%s\n' "$META" | awk -F'"title": "' '{print $2}' | awk -F'",' '{print $1}')

# NOT POSIX use jq
TITLE=$(echo "$META" |  jq -r '.title')
FRONTMATTER=$(echo "$META" | jq -r ' 
  "id: \(.id)\n"
  + "title: \"\(.title)\"\n"
  + "description: |\n"
  + (.description | gsub("\r?\n"; "\n    ") | "    " + . + "\n")
  + "publishedAt: \"\(.publishedAt)\"\n"
  + "channelId: \"\(.channelId)\"\n"
  + "channelTitle: \"\(.channelTitle)\"\n"
  + "likeCount: \(.likeCount)\n"
  ')

NAME="${2:-$(date +%s)}"
fabric --youtube="$1" > "$NAME-youtube-transcription.tmp.md" \
  && fabric -p extract_wisdom -o "$NAME-wisdom.tmp.md" < "$NAME-youtube-transcription.tmp.md" \
  && fabric -p write_essay -o "$NAME-essay.tmp.md" < "$NAME-youtube-transcription.tmp.md"

if [ $? -eq 0 ]; then
cat <<EOF >>${NAME}.md
---
URL: $1
$FRONTMATTER
---

# $TITLE
  
EOF
fi

if [ $? -eq 0 ]; then
  # Formating wisdom output and merge result
  # - remove ```markdown blocks
  # - translate h1 to h2 headers and remove trailing `:`
  # - lowercase headers
  gsed -i \
  -e '/^```markdown/d' \
  -e '/^```/d' \
  -e 's/^#\+ \(.*\):\?$/## \1/' \
  -e 's/^## \(.*\)/## \L\1/' \
   "${NAME}-wisdom.tmp.md"
  cat "${NAME}-wisdom.tmp.md" >> "${NAME}.md" 
  cat "${NAME}-essay.tmp.md" >> "${NAME}.md" 
  
  rm *.tmp.md
fi
  echo "${NAME}.md is done"
}

