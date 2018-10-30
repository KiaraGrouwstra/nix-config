{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    firefox-devedition-bin
    google-chrome
    # chromium
    # tor-browser-bundle
    # brave
  ];

  nixpkgs.config = {
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/browsers/firefox/wrapper.nix
    # ~/.mozilla/firefox/*.default/browser-extension-data/
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
