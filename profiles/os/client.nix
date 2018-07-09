{ pkgs, ... }:

let
  master = import ../../master.nix;
  secrets = import ../../secrets.nix;
in
rec {

  # boot.blacklistedKernelModules = [ "i915" ];

  environment.systemPackages = with master; [
    gparted
  ];

  # touchpad
  services.xserver.libinput.enable = true;

  # sound
  # fix manually: settings -> sound -> input -> enable input, fix volume
  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
    # cpu.intel.updateMicrocode = true;
    # bumblebee = {
    #   connectDisplay = true;
    #   enable = true;
    # };
  };

  services.printing.enable = true;

}
