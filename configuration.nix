{

  _module.args.pkgs = import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/5828cb3af7ee2ebe7dc460f778dc2300259ea7c4.tar.gz";
      sha256 = "0p46vg4af884z8kpiq99zcrhq6al7rpmlm7zqwddakmrjww22lax";
    }) {};

  imports = [
    ./hardware-configuration.nix
    ./configuration-common.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "18.03";
  security.sudo.enable = true;
  nix.buildCores = 4;

  services.xserver = {
    enable = true;
    desktopManager.gnome3.enable = true;
    displayManager.gdm.enable = true;
  };

}
