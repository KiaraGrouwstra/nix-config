{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    adapta-gtk-theme
    paper-icon-theme
  ];

}
