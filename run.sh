branch=`git rev-parse --abbrev-ref HEAD`
sudo cp -r ./* /etc/nixos/ && \
sudo nixos-rebuild dry-build --upgrade && \
sudo nixos-rebuild switch -p $branch --upgrade && \
git add . && \
git commit -a

