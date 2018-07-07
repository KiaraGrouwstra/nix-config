{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    # home-assistant
    # hue-cli
  ];
}
