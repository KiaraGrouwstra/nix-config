{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    tdesktop  # telegram
    # slack
    # zoom-us
  ];

  # set telegram theme manually: Telegram -> settings -> Chat background -> Choose from file -> /nix/store/*-adapta-gtk-theme-*/share/themes/Adapta-Nokto/telegram/

}
