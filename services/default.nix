{ config, pkgs, ... }:

{
  imports = [
    ./locate.nix
    ./sshd.nix
  ];
}
