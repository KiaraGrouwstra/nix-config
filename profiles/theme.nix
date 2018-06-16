{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    adapta-gtk-theme
    paper-icon-theme
  ];

  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''

    # theme

    # TODO: carousel
    [org.gnome.desktop.background]
    picture-uri='https://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png'

    [org.gnome.desktop.screensaver]
    picture-uri='https://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png'

    [org.gnome.desktop.interface]
    gtk-theme="Adapta-Nokto"
    icon-theme="Paper-Mono-Dark"
    cursor-theme="Paper"

    [org.gnome.desktop.wm.preferences]
    theme="Adapta-Nokto"

  '';

}
