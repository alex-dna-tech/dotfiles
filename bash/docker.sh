alias d='docker'
alias dm='docker-machine'
alias dc='docker-compose'
alias dcr='docker-compose run'
alias dcu='docker-compose up -d'
alias dce='docker-compose exec'
alias dcd='docker-compose down'
alias dclg='docker-compose logs'
alias dst='docker stop'
alias dsta='docker stop $(docker ps -a -q)'
alias drm='docker rm'
alias drma='docker rm $(docker ps -a -q)'
alias drmi='docker rmi'
alias drmia='docker rmi $(docker images -q)'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dr='docker run'
alias drit='docker run -it --rm'
alias driv='docker run -it --rm -v $(pwd):/data'
alias drd='docker run -d --rm'
alias de='docker exec -it'
alias dl='docker logs'
alias dsp='docker system prune'

alias laws='docker run --network localstack --rm -it amazon/aws-cli --endpoint-url=http://localstack:4566'
