# https://github.com/ghuntley/dotfiles-nixos/tree/master/machines
{ pkgs, ... }:

{
  imports = [
    ../profiles/os/client.nix
    ../profiles/os/tychotop.nix
  ];

  # Speed up development at the cost of possible build race conditions
  nix.buildCores = 4;

  networking.hostName = "klink";

  # stop-gap solution to bcachefs
  nix.autoOptimiseStore = true;

  boot.supportedFilesystems = [ "bcachefs" ];

  services.xserver = {
    # https://nixos.wiki/wiki/Keyboard_Layout_Customization
    # xkbModel = "pc104";
    # xkbVariant = "colemak";  # this seems to work only during login, before entering the desktop
    # export to /etc/X11/
    exportConfiguration = true;
    # displayManager.sessionCommands = "${pkgs.xorg.xkbcomp}/bin/xkbcomp ${/home/tycho/X11/xkb/layout.xkb} $DISPLAY";
    # xkbDir = "/home/tycho/X11/xkb";  # after copying over files from /etc/X11/xkb
  };

}
