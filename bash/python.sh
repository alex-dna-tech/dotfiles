function penv()
{
  python3 -m venv "${1:-.venv}"
  source "${1:-.venv}/bin/activate"
  [[ -f requirements.txt ]] && pip install -r requirements.txt
}

alias pi="pip3 install -r requirements.txt"
alias pu="pip uninstall -r requirements.txt -y"
function pe ()
{
  if [[ -d "${HOME}/.venv" ]]; then
    source "${HOME}/.venv/bin/activate"
  else
    penv "${HOME}/.venv"
  fi
}

alias jl="jupyter lab"

# Fabric
function yts () {
  yt --transcript $1 | ${3:-extract_wisdom} -s | save -s "${2:-youtube}"
}

