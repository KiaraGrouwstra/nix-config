if [ $1 ]; then
  #  --show-trace
  sudo cp -r ./* /etc/nixos/ && \
  sudo nixos-rebuild dry-build && \
  sudo nixos-rebuild switch -p $1 && \
  git add . && \
  git commit -am "$1"
else
  echo "add a name!"
fi
