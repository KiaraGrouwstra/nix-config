{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    kate
    libreoffice
  ];

}
