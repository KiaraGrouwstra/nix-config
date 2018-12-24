branch=`git rev-parse --abbrev-ref HEAD`
sudo cp -r ./* /etc/nixos/ && \
sudo nixos-rebuild dry-build && \
sudo nixos-rebuild switch -p $branch && \
git add . && \
git commit -a

