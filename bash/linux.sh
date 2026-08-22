alias youtube-dl='youtube-dl --format bestvideo+bestaudio[ext=mp4]/bestvideo+bestaudio/best'


if [ -f /etc/alpine-release ]; then
  alias rs='sudo rc-service'
  alias ru='sudo rc-update'
else
  alias sys='sudo systemctl start'
  alias syss='sudo systemctl status'
  alias syst='sudo systemctl stop'
  alias syse='sudo systemctl enable'
  alias sysd='sudo systemctl disable'
fi
