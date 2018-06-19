{ config, pkgs, ... }:

{

  imports = [
    ./chat.nix
    # ./media.nix
    # ./games.nix
  ];

  environment.systemPackages = with pkgs; [
    webtorrent_desktop
  ];

}
