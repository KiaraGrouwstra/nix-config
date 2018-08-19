{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apacheKafka
    redis
    neo4j
  ];
}
