{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.jdk
  ];
}
