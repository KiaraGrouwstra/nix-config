if [ $1 ]; then
  sudo cp ./configuration.nix /etc/nixos/ && sudo nixos-rebuild dry-build && sudo nixos-rebuild switch -p $1 && cp ./dotfiles/* ~ && git add . && git commit -am "$1"
else
  echo "add a name!"
fi
