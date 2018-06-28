{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    nodePackages.npm
    nodePackages.azure-cli
    # nodePackages.webtorrent-cli
    postman
  ];
}
