{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    master.go
    master.dotnet-sdk
    master.scala
  ];
}
