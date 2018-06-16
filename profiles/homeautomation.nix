{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-assistant
    # hue-cli
  ];
}
