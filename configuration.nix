{
  _module.args.pkgs = import /drogon/Coding/nix/nixpkgs {};
  boot.loader.systemd-boot.enable = true;
  nix.buildCores = 4;
  imports = [./hardware-configuration.nix];
}
