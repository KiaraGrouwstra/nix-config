{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    adapta-gtk-theme
    paper-icon-theme
  ];

  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''

    # theme

    [org.gnome.desktop.background]
    picture-uri='file:///home/tycho/.local/share/shotwell/wallpaper/wallpaper.xml'

    [org.gnome.desktop.screensaver]
    picture-uri='file:///home/tycho/.local/share/shotwell/wallpaper/wallpaper.xml'

    [org.gnome.desktop.interface]
    gtk-theme="Adapta-Nokto"
    icon-theme="Paper-Mono-Dark"
    cursor-theme="Paper"

    [org.gnome.desktop.wm.preferences]
    theme="Adapta-Nokto"

  '';

}
