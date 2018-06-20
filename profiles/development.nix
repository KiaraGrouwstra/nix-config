{ config, lib, pkgs, ... }:

{
  imports = [
    ./haskell.nix
    ./ruby.nix
    ./javascript.nix
  ];

  # install development packages
  environment.systemPackages = with pkgs; [
    gnumake
    zlib
  ];

  # custom packages
  nixpkgs.config.packageOverrides = pkgs: rec {
  };

}
