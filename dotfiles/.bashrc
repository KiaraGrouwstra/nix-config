eval $(thefuck --alias)
alias torrench="docker run --rm -it jaymoulin/torrench --risky --interactive"
alias hass="docker run --rm -it -p 8123:8123 -v $HOME/.config/homeassistant:/config homeassistant/home-assistant"
alias wt="webtorrent download $@ --vlc"
