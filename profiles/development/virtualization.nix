{ pkgs, ... }:

{

  imports = [
    ./docker.nix
  ];

  environment.systemPackages = with pkgs; [
    virtualbox
    # kvm
    # qemu
    # vagrant
    # virtmanager
    gnome-boxes
  ];

  virtualisation = {
    virtualbox.host.enable = true;
    # libvirtd = {
    #   enable = true;
    #   onShutdown = "shutdown";
    # };
  };
}
