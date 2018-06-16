{ config, pkgs, ... }:

let secrets = import ../secrets.nix;
in
rec {

  environment.systemPackages = with pkgs; [
    gparted
  ];

  # touchpad
  libinput.enable = true;

  # sound
  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
  };

  printing.enable = true;

}
