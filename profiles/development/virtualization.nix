{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  imports = [
    ./docker.nix
  ];

  environment.systemPackages = with master; [
    virtualbox
    # kvm
    # qemu
    # vagrant
    # virtmanager
  ];

  virtualisation = {
    virtualbox.host.enable = true;
    # libvirtd = {
    #   enable = true;
    #   onShutdown = "shutdown";
    # };
  };
}
