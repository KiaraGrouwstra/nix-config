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
follow the [default MBR instructions](https://nixos.org/nixos/manual/index.html#sec-installation-summary), swapping out the `mount` step with:
```bash
bcachefs format	\
--label=nixos \
--error_action=panic \
--data_replicas=2 \
--metadata_replicas=3 \
--group ssd /dev/sdb1 \
--group hdd /dev/sda1 \
--foreground_target ssd	\
--background_target hdd	\
--promote_target ssd

mount -t bcachefs /dev/sda1:/dev/sdb1 /mnt
```
(both `/dev/sda` and `/dev/sda1` can work, depending on whether you wanna split a drive up into multiple partitions.)

then edit the config files:
```bash
nano /mnt/etc/nixos/configuration.nix  # uncomment `boot.loader.grub.device = "/dev/sda";`, `boot.loader.systemd-boot.enable = true;`
nano /mnt/etc/nixos/hardware-configuration.nix  # set `/boot` device to `/dev/sda3`
```

then after install:
```bash
nano /etc/nixos/configuration.nix  # uncomment stuff, add wget, git
nixos-rebuild switch
cp secrets.sample.nix secrets.nix
# cp /etc/nixos/hardware-configuration.nix ./
git clone https://github.com/tycho01/nix-config.git
cd nix-config
cp -r ./ /etc/nixos/
# nano /etc/nixos/users/tycho.nix  # set password
# nano /etc/nixos/profiles/os/tychotop.nix  # disable unneeded categories
nixos-rebuild switch
systemctl start display-manager.service
nix-channel --add https://nixos.org/channels/nixos-unstable-small
# readd secrets from gist
# configure defaults:
# firefox -> settings -> preferences -> auto scroll, search engine -> DDG, customize -> uncheck title bar
# konsole -> settings -> edit current profile -> appearance -> solarized
# bottom bar -> right click -> alternatives -> icons-only task manager
# system settings -> input devices -> keyboard -> layouts -> switching policy -> application
# system settings -> input devices -> keyboard -> advanced -> caps lock behavior -> make caps lock an additional Esc
# lockscreen slideshow: System Settings -> Desktop Behavior -> Screen Locking -> Appearance > Slideshow > Add Folder
# wallpaper: Right click the desktop > Configure Desktop > Wallpaper > Wallpaper Type > Slideshow > Add Folder
# telegram -> night mode
# reclone nix-config from user, rebuild that
fish
curl -L https://get.oh-my.fish | fish
```
