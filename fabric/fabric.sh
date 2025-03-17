alias mh='pandoc -f markdown -t html'
alias hm='html2markdown'
alias www='go-readability'
alias fb='fabric'
alias fbu='fabric -g=uk'

ytwe(){
# TODO: get `fabric --metadata` name and properties generation for this url
NAME="${2:-$(date +%s)}"
fabric -y "$1" > "$NAME-youtube-transcription.tmp" \
  && extract_wisdom -o "$NAME-wisdom.tmp" < "$NAME-youtube-transcription.tmp" \
  && write_essay -o "$NAME-essay.tmp" < "$NAME-youtube-transcription.tmp" \
  && cat <<EOF >${NAME}.md
---
youtube: $1
---
# ${NAME}
  
EOF

if [ $? -eq 0 ]; then
  cat "${NAME}-essay.tmp" >> "${NAME}.md" 
  
  # TODO: use `gsed` to change `^# ` to `## ` and erase `:` in the ends of headers
  cat "${NAME}-wisdom.tmp" >> "${NAME}.md" 
  rm $NAME*.tmp
fi
  echo "${NAME} is done"
}

