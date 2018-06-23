{ config, pkgs, ... }:

let
  secrets = import ../secrets.nix;
in
{ # rec {

  imports = [
    ./development.nix
    ./vscode.nix
  ];

  environment.systemPackages = with pkgs; [
    gitkraken
  ];

}
