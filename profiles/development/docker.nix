{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
