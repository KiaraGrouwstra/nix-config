{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    thefuck
    lolcat
    figlet
    beep
    tldr
    xbindkeys
    service-wrapper
    kdeconnect
    latte-dock

    # nix / disk
    ncdu
    nix-du

    # password managers
    # pkgs.1password
    keepass
    keepassx
  ];
}
