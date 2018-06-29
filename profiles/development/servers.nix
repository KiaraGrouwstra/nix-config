{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    apacheKafka
    redis
    neo4j
  ];
}
