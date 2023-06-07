if [[ -x "$(command -v php)" ]]; then
  alias bc='./bin/console'
  alias sdmm='./bin/console doctrine:migrations:migrate'
  alias sdmd='./bin/console doctrine:migrations:diff'
  alias sdr='./bin/console debug:router'
fi
