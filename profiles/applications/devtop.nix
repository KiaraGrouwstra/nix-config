{ config, pkgs, ... }:

let
  secrets = import ../secrets.nix;
in
rec {

  imports = [
    ../development/default.nix
    ./vscode.nix
  ];

  environment.systemPackages = with pkgs; [
    gitkraken
    # idea-ultimate
  ];

}
