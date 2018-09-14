{ config, lib, pkgs, ... }:

let
  nvidiaDocker = import ./nvidia-docker/default.nix { inherit pkgs; };
in
{
  imports = [
    ./haskell.nix
    ./perl.nix
    ./python.nix
    ./ruby.nix
    ./web.nix
    ./servers.nix
    ./compilers.nix
    ./latex.nix
    ./mathematics.nix
  ];

  # install development packages
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    binutils-unwrapped
    zlib
    protobuf
    nvidiaDocker
    snappy
    nix-generate-from-cpan
  ];

  # custom packages
  nixpkgs.config.packageOverrides = pkgs: rec {
  };

}
