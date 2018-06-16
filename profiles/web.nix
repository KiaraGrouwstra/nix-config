{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    firefox
    # firefox-bin
    # firefox-devedition-bin
    # chromium
  ];

  programs = {
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/browsers/firefox/wrapper.nix
    # TODO: login, ublock prebake
    firefox = {
      jre = false;
      enableAdobeFlash = false;
    };

    chromium = {
      jre = false;
      enableAdobeFlash = false;
    };
  };

}
