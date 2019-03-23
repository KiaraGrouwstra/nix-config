{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
    docker_compose
    skopeo  # skopeo inspect docker://docker.io/nixos/nix:1.11 | jq -r '.Digest'
    jq
  ];

  virtualisation = {
    # libvirtd.enable = true;
    lxc.enable = true;
    lxc.usernetConfig = ''
      bfo veth lxcbr0 10
    '';
    docker = {
      enable = true;
      # storageDriver = "overlay";
      # extraOptions = '' --data-root "/drogon/root/var/lib/docker" '';
    };
  };
}
