{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    docker
    skopeo  # skopeo inspect docker://docker.io/nixos/nix:1.11 | jq -r '.Digest'
    jq
  ];

  virtualisation = {
    libvirtd.enable = true;
    lxc.enable = true;
    lxc.usernetConfig = ''
      bfo veth lxcbr0 10
    '';
    docker = {
      enable = true;
      storageDriver = "overlay";
      extraOptions = '' --data-root "/run/media/tycho/Drogon/root/var/lib/docker" '';
    };
  };
}
