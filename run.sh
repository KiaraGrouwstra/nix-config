if [ $1 ]; then
  sudo cp -r ./* /etc/nixos/ && \
  sudo nixos-rebuild dry-build && \
  sudo nixos-rebuild switch && \
  git add . && \
  git commit -am "$1" && \
  git push --all
else
  echo "add a name!"
fi
