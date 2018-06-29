{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  imports = [
    ./docker.nix
  ];

  environment.systemPackages = with master; [
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
