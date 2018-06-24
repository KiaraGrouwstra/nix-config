{

  # services.xserver.desktopManager.gnome3.extraGSettingsOverrides
  extraGSettingsOverrides = ''

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

    [org.gnome.desktop.interface]
    clock-show-date=true

    [org.gnome.desktop.background]
    show-desktop-icons=true

    [org.gnome.shell]
    # installed: ~/.local/share/app-info/xmls/extensions-web.xml
    # use `dconf watch /` then change stuff in gnome tweak tool
    enabled-extensions=['windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'alternate-tab@gnome-shell-extensions.gcampax.github.com']

  '';

}
