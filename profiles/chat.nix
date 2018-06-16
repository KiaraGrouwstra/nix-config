{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    tdesktop  # telegram
    # slack
    # zoom-us
  ];

  # TODO: telegram theme: /nix/store/9piinf7pzsv6yrvx0yqnsrhcnmwlqpkf-adapta-gtk-theme-3.93.0.1/share/themes/Adapta-Nokto/telegram/

}
