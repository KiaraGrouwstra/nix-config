{ config, pkgs, ... }:

let secrets = import ../secrets.nix;
in
rec {

  imports = [
    ./development.nix
  ];

  environment.systemPackages = with pkgs; [
    gitkraken
    vscode
    # TODO: vscode extensions
    # # code --list-extensions
    # # - EditorConfig.EditorConfig
    # # - Equinusocio.vsc-material-theme
    # # - PKief.material-icon-theme
    # # - bbenoist.Nix
    # # - skyapps.fish-vscode
    # # ls ~/.vscode/extensions
    # vscode-with-extensions.override {
    #   vscodeExtensions = vscode-utils.extensionsFromVscodeMarketplace [
    #     {
    #       name = "code-runner";
    #       publisher = "formulahendry";
    #       version = "0.6.33";
    #       sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
    #     }
    #   ];
    # }
  ];

}
