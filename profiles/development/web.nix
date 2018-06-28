{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    nodePackages.npm
    nodePackages.typescript
    # nodePackages.webtorrent-cli
    postman
  ];
}
