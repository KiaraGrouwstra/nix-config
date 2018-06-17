{ config, pkgs, ... }:

let
  overlay = self: super: {
    # TODO: fix extensions
    vscode-with-extensions = super.vscode-with-extensions.override {
      # code --list-extensions --show-versions
      # ls ~/.vscode/extensions
      vscodeExtensions =
        super.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "EditorConfig";
            publisher = "EditorConfig";
            version = "0.12.4";
            sha256 = "067mxkzjmgz9lv5443ig7jc4dpgml4pz0dac0xmqrdmiwml6j4k4";
          }
          {
            name = "vsc-material-theme";
            publisher = "Equinusocio";
            version = "2.1.0";
            sha256 = "1rhygrig9z1kxy0ldw28zm6xldjji53s1apxl2n9yi9vl0wn8np1";
          }
          {
            name = "material-icon-theme";
            publisher = "PKief";
            version = "3.5.0";
            sha256 = "0djr8dxhpf81y3x2haj7jriqsmi87may43myph3rgqmzw2s986sg";
          }
          {
            name = "Nix";
            publisher = "bbenoist";
            version = "1.0.1";
            sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
          }
          {
            name = "fish-vscode";
            publisher = "skyapps";
            version = "0.2.0";
            sha256 = "148r186y3h7n84fcyh6wa2qwl2q3pfi8aykwkc9dhfj3kwfcm5rb";
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
    # vscode
    vscode-with-extensions
  ];

}
