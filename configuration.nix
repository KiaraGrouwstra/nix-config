# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  # _module.args.pkgs = import /drogon/Coding/nix/nixpkgs {
  #   config.allowUnfree = true;
  # };
  imports = [
    ./hardware-configuration.nix
    ./configuration-common.nix
    ./machines/klink.nix
  ];

}
