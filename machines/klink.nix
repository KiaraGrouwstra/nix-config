# https://github.com/ghuntley/dotfiles-nixos/tree/master/machines
{ config, pkgs, ... }:

{
  imports =
    [
      ../profiles/client.nix
      ../profiles/tychotop.nix
    ];

  # Speed up development at the cost of possible build race conditions
  nix.buildCores = 4;

  networking.hostName = "klink";

  # # https://askubuntu.com/questions/742946/how-to-find-the-hwdb-header-of-a-general-input-device#743291
  # udev.extraHwdb = ''
  #   # Microsoft Natural Ergonomic Keyboard 4000
  #   keyboard:usb:v045Ep00DB*
  #   KEYBOARD_KEY_c022d=pageup
  #   KEYBOARD_KEY_c022e=pagedown
  # '';

  # https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg
  # https://help.ubuntu.com/community/GtkComposeTable
  # TODO: debug this
  services.xserver.xkbOptions = "compose:swapcaps, menu:ralt";

}
