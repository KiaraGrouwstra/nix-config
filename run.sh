if [ $1 ]; then
  sudo cp -r ./* /etc/nixos/ && sudo nixos-rebuild dry-build && sudo nixos-rebuild switch -p $1 && git add . && git commit -am "$1" && sudo cp -r /etc/nixos/dotfiles/. ./dotfiles/ && git status
else
  echo "add a name!"
fi
