if [ $1 ]; then
  # TODO: prompt on dotfile overwrite to allow upstreaming on clash
  sudo cp -r ./* /etc/nixos/ && sudo nixos-rebuild dry-build && sudo nixos-rebuild switch -p $1 && git add . && git commit -am "$1"
else
  echo "add a name!"
fi
