{ pkgs, ... }:

let secrets = import ../../secrets.nix;
in
rec {

  # boot.blacklistedKernelModules = [ "i915" ];

  environment.systemPackages = with pkgs; [
    gparted
  ];

  # touchpad
  services.xserver.libinput.enable = true;

  # sound
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
