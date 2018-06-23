{ config, pkgs, ... }:

let secrets = import ../secrets.nix;
in
{ # rec {

  environment.systemPackages = with pkgs; [
    gparted
  ];

  # touchpad
  services.xserver.libinput.enable = true;

  # sound
  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
  };

  services.printing.enable = true;

}
