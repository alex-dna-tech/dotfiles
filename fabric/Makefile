GOPATH = $(shell go env GOPATH)

.PHONY: update
uninstall: 
	rm $(GOPATH)/bin/fabric $(GOPATH)/bin/html2markdown $(GOPATH)/bin/go-readability

.PHONY: install
install: $(GOPATH)/bin/fabric $(GOPATH)/bin/html2markdown $(GOPATH)/bin/go-readability

.PHONY: fb
fb: $(GOPATH)/bin/fabric

$(GOPATH)/bin/fabric:
	go install github.com/danielmiessler/fabric@latest

.PHONY: hm
hm: $(GOPATH)/bin/html2markdown

$(GOPATH)/bin/html2markdown:
	go install github.com/JohannesKaufmann/html-to-markdown/v2/cli/html2markdown@latest

.PHONY: www
www: $(GOPATH)/bin/go-readability

$(GOPATH)/bin/go-readability:
	go install github.com/go-shiori/go-readability/cmd/go-readability@latest


