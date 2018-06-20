{ config, pkgs, ... }:

{

  imports = [
    ./docker.nix
  ];

  environment.systemPackages = with pkgs; [
    # kvm
    # qemu
    # vagrant
    # virtmanager
  ];

  # virtualisation.libvirtd = {
  #   enable = true;
  #   onShutdown = "shutdown";
  # };
}
