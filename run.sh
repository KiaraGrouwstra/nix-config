[ $1 ] && (git add . && git commit -am "$1" && sudo cp /home/tycho/Desktop/nix/configuration.nix /etc/nixos/ && sudo nixos-rebuild switch -p $1) || "add a name!"

