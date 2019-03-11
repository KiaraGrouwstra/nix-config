# nix-config

This is the configuration making up my [NixOS](https://nixos.org/) setup.

## Usage
```bash
# set secrets
cp secrets.sample.nix secrets.nix
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

## Install

- ensure boot mode is set to UEFI in the BIOS (for me: on boot mash `Del`)
- follow the [default instructions](https://nixos.org/nixos/manual/index.html#sec-installation-summary)
- for bcachefs replace the `mount` step with:
```bash
bcachefs format	--label=nixos --error_action=panic --data_replicas=2 --metadata_replicas=3 --group ssd /dev/sdb1 --group hdd /dev/sda1 --foreground_target ssd	--background_target hdd	--promote_target ssd
mount -t bcachefs /dev/sda1:/dev/sdb1 /mnt
```
- `nano configuration.nix` (add git)
- after install:
```bash
cd /etc/nixos
git clone https://github.com/tycho01/nix-config.git
mv configuration.nix configuration_.nix
cp -r nix-config .
cp secrets.sample.nix secrets.nix
nano /etc/nixos/users/tycho.nix  # set password
nano /etc/nixos/profiles/os/tychotop.nix  # disable unneeded categories
nixos-rebuild switch
systemctl start display-manager.service
```

- back up hardware conf to gist: `cat /etc/nixos/hardware-configuration.nix`
- readd secrets from gist, set up ssh:
```bash
sudo chown -R tycho ~
vi /etc/nixos/secrets.nix
mkdir ~/.ssh
cp /etc/nixos/dotfiles/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub
vi ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
```

more commands:
```
curl -L https://get.oh-my.fish | fish
omf install agnoster
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo mkdir /etc/nixos/private
sudo mkdir /etc/nixos/public
# back up dotfiles
sudo mkdir /bkp
sudo cp -r ~/ /bkp
# rebuild
cd ~/Desktop
git clone git@github.com:tycho01/nix-config.git
cd nix-config
cp -r /etc/nixos .
git status
# copy dotfiles as per output
```

configure defaults:
- firefox -> settings -> preferences -> auto scroll, search engine -> DDG, customize -> uncheck title bar
- konsole -> settings -> edit current profile -> appearance -> solarized
- bottom bar -> right click -> alternatives -> icons-only task manager
- system settings -> input devices -> keyboard -> layouts -> switching policy -> application
- system settings -> input devices -> keyboard -> advanced -> caps lock behavior -> make caps lock an additional Esc
- // lockscreen slideshow: System Settings -> Desktop Behavior -> Screen Locking -> Appearance > Slideshow > Add Folder
- // wallpaper: Right click the desktop > Configure Desktop > Wallpaper > Wallpaper Type > Slideshow > Add Folder
- telegram -> night mode
