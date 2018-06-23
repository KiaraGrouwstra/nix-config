{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    thefuck
    lolcat
    figlet
    beep

    # password managers
    # pkgs.1password
    keepass
    keepassx
  ];
}
