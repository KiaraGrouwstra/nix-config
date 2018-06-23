{ config, lib, pkgs, ... }:

{
  imports = [
    ./haskell.nix
    ./ruby.nix
    ./javascript.nix
  ];

  # install development packages
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    binutils-unwrapped
    zlib
  ];

  # custom packages
  nixpkgs.config.packageOverrides = pkgs: rec {
  };

}
