# once:
# sudo ln -s /run/current-system/sw/bin/bash /bin/bash

alias torrench="docker run --rm -it jaymoulin/torrench --risky --interactive"
alias hass="docker run --rm -it -p 8123:8123 -v $HOME/.config/homeassistant:/config homeassistant/home-assistant"
alias gsconnect="gjs ~/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js"

export SBT_OPTS="-Xmx1024M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G

