{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    go
    dotnet-sdk
    scala
  ];
}
