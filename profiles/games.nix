{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    steam
  ];

  nixpkgs.config.packageOverrides = pkgs: rec {
    # steam = pkgs.callPackage ../pkgs/steam/chrootenv.nix { };
  };
}
