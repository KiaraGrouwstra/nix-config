{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    retroarch
    steam
  ];

  nixpkgs.config.packageOverrides = pkgs: rec {
    # steam = pkgs.callPackage ../pkgs/steam/chrootenv.nix { };
  };
}
