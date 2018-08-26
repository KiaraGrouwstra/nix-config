# nix-config

This is the configuration making up my [NixOS](https://nixos.org/) setup.

## Usage
```bash
# test changes
sudo cp -r ./* /etc/nixos/; sudo nixos-rebuild test
# build, switch and commit
bash run.sh my-comment
# pull updates
sudo nixos-rebuild switch --upgrade
```

## References
- https://nixos.org/nixos/packages.html
- https://nixos.org/nixos/options.html
- https://github.com/NixOS/nixpkgs/
- https://nixos.wiki/wiki/Cheatsheet
- http://howoldis.herokuapp.com/
- http://www.haskellforall.com/2018/08/nixos-in-production.html
- https://github.com/ghuntley/dotfiles-nixos
