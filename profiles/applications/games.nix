{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    retroarch
    steam
  ];

  nixpkgs.config.packageOverrides = pkgs: rec {
    # steam = pkgs.callPackage ../pkgs/steam/chrootenv.nix { };
  };
}
