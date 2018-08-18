{ config, lib, pkgs, ... }:

let
  master = import ../../master.nix;
  nvidiaDocker = import ./nvidia-docker/default.nix;
in
{
  imports = [
    # ./haskell.nix
    # ./python.nix
    ./ruby.nix
    # ./web.nix
    # ./servers.nix
    # ./compilers.nix
    # ./latex.nix
    # ./mathematics.nix
  ];

  # install development packages
  environment.systemPackages = with master; [
    gcc
    gnumake
    binutils-unwrapped
    zlib
    protobuf
    # nvidiaDocker
    snappy
    nix-generate-from-cpan
  ];

  # custom packages
  nixpkgs.config.packageOverrides = pkgs: rec {
  };

}
