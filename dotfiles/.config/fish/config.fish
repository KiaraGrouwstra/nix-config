fish_default_key_bindings
# fish_vi_key_bindings

source ~/shared.sh
# thefuck --alias | source
# #730
function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge ^ /dev/null
  end
end

# alias torrench="docker run --rm -it jaymoulin/torrench --risky --interactive"
# alias hass="docker run --rm -it -p 8123:8123 -v $HOME/.config/homeassistant:/config homeassistant/home-assistant"
# alias gsconnect="gjs ~/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js"
