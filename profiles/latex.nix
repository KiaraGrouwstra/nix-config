{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # pandoc
    texlive
  ];
}
