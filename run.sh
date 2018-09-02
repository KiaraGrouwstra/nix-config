if [ $1 ]; then
  branch=`git rev-parse --abbrev-ref HEAD`
  sudo cp -r ./* /etc/nixos/ && \
  sudo nixos-rebuild dry-build && \
  sudo nixos-rebuild switch -p $branch && \
  git add . && \
  git commit -am "$1" && \
  git push --all
else
  echo "add a name!"
fi
