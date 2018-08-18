{

  _module.args.pkgs = import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/7098b0fcdfd7fa4b82c036d8116b60b78f497316.tar.gz";
      sha256 = "0df0y4vd10a56352q5isf0xnajimf53pn8rqm3b4kg7bsdya4cbl";
    }) {};

  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "18.03";
  nix.buildCores = 4;

  users.extraUsers.tycho = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/tycho";
    extraGroups = ["users" "wheel"];
  };

}
