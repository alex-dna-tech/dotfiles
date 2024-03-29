if [[ -x "$(command -v go)" ]]; then
  export GO111MODULE=on
  alias gomod='go mod init alex-dna-tech/$(basename $PWD)'
  alias gohttp='godoc -http=:6060'
  alias gocln='go clean --modcache'
  alias gi='go install .'
  alias gu='go get ./...'
fi
