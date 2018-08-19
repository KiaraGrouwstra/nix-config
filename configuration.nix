{
  _module.args.pkgs = import /run/media/tycho/Drogon/Coding/nix/nixpkgs {};
  boot.loader.systemd-boot.enable = true;
  nix.buildCores = 4;
  imports = [./hardware-configuration.nix];
}
