{ config, lib, pkgs, ... }:

{
  imports = [
    ./haskell.nix
    ./python.nix
    ./ruby.nix
    ./javascript.nix
    ./servers.nix
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
