{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  imports = [
    ./chat.nix
    ./media.nix
    ./games.nix
  ];

  environment.systemPackages = with master; [
    webtorrent_desktop
  ];

}
