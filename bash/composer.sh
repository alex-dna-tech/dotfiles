if [[ -x "$(command -v composer)" ]]; then
  alias c="composer"
  alias ci="composer install"
  alias cu="composer update"
  alias cr="composer require"
  alias csu="composer self-update"
fi
