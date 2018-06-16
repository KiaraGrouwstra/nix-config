{ config, lib, pkgs, ... }:

{
  imports = [
    # ./haskell.nix
    # ./ruby.nix
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
