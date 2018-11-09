{ pkgs, ... }:

{

  imports = [
    ../development/default.nix
    ./vscode.nix
  ];

  environment.systemPackages = with pkgs; [
    dpkg
    # gitkraken
    # idea-ultimate
    atom
  ];

}
