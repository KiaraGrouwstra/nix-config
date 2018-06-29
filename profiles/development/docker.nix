{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    docker
  ];

  virtualisation = {
    libvirtd.enable = true;
    lxc.enable = true;
    lxc.usernetConfig = ''
      bfo veth lxcbr0 10
    '';
    docker.enable = true;
    docker.storageDriver = "overlay";
  };
}
