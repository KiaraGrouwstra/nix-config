{
  _module.args.pkgs = import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/322b2043f92b00a74246772349fd03c6c3513a15.tar.gz";
      sha256 = "0nxmfnbiymp82zrn7fd012dlwxc5mc16qyhns7vpa4q79k4qyf1d";
    }) {};

  boot.loader.systemd-boot.enable = true;
  imports = [./hardware-configuration.nix];
}
