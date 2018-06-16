# TODO: handle dotfile copying from nixos-rebuild
if [ $1 ]; then
  sudo cp -r ./* /etc/nixos/ && sudo nixos-rebuild dry-build && sudo nixos-rebuild switch -p $1 && cp -r ./dotfiles/. ~ && git add . && git commit -am "$1" && git push
else
  echo "add a name!"
fi
