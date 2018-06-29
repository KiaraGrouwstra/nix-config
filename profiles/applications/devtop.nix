{ config, pkgs, ... }:

let
  master = import ../../master.nix;
  secrets = import ../secrets.nix;
in
rec {

  imports = [
    ../development/default.nix
    ./vscode.nix
  ];

  environment.systemPackages = with master; [
    gitkraken
    # idea-ultimate
  ];

}
