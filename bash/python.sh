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

pmd () {
  cat << 'EOF' > "${1:-main.py}"
from dotenv import load_dotenv

load_dotenv()

def main():
    print("Hello, World!")

if __name__ == "__main__":
    main()
EOF
  echo "python-dotenv" > requirements.txt
}

alias jl="jupyter lab"

ipkn ()
{
  ipython kernel install --user --name=${1:-venv}
}

# Fabric
function yts () {
  yt --transcript "$1" | fabric -p "${3:-extract_wisdom}" | save -s "${2:-youtube}"
}

