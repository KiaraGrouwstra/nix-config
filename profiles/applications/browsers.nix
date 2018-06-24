{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    firefox-devedition-bin
    # chromium
    # tor-browser-bundle
  ];

  nixpkgs.config = {
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/browsers/firefox/wrapper.nix
    # ~/.mozilla/firefox/*.default/browser-extension-data/
    firefox = {
      jre = false;
      enableAdobeFlash = false;
      enableGnomeExtensions = true;
    };

    chromium = {
      jre = false;
      enableAdobeFlash = false;
    };
  };

}
