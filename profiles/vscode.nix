{ config, pkgs, ... }:

let
  overlay = self: super: {
    vscode-with-extensions = super.vscode-with-extensions.override {
      # code --list-extensions --show-versions
      # ls ~/.vscode/extensions
      vscodeExtensions =
        super.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscode-hie-server";
            publisher = "alanz";
            version = "0.0.19";
            sha256 = "0x0cs7c5q90p1ffig2wb5v21z3yj3p2chgpvbnlm4gfsnw7qpfzr";
          }
          {
            name = "EditorConfig";
            publisher = "EditorConfig";
            version = "0.12.4";
            sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
          }
          {
            name = "vsc-material-theme";
            publisher = "Equinusocio";
            version = "2.1.0";
            sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
          }
          {
            name = "material-icon-theme";
            publisher = "PKief";
            version = "3.5.0";
            sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
          }
          {
            name = "Nix";
            publisher = "bbenoist";
            version = "1.0.1";
            sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
          }
          {
            name = "fish-vscode";
            publisher = "skyapps";
            version = "0.2.0";
            sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
          }
        ];
        # ] ++ with super.vscode-extensions; [
        #   bbenoist.Nix
        # ];
    };
  };
in
{

  nixpkgs.overlays = [ overlay ];

  environment.systemPackages = with pkgs; [
    vscode
  ];

}
