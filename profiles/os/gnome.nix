{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    gnome-shell-dash-to-dock
    chrome-gnome-shell
  ];

  services.gnome3.chrome-gnome-shell.enable = true;

  # `dconf dump /`
  # installed: ~/.local/share/app-info/xmls/extensions-web.xml
  # use `dconf watch /` then change stuff in gnome tweak tool
  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''

    [org/gnome/settings-daemon/plugins/power]
    sleep-inactive-battery-type='nothing'
    sleep-inactive-ac-timeout=3600
    sleep-inactive-ac-type='nothing'
    sleep-inactive-battery-timeout=1800

    [org/gnome/settings-daemon/plugins/xsettings]
    antialiasing='grayscale'
    hinting='slight'

    [org/gnome/settings-daemon/peripherals/keyboard]
    numlock-state='off'

    [org/gnome/shell]
    app-picker-view=uint32 1
    enabled-extensions=['windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'alternate-tab@gnome-shell-extensions.gcampax.github.com']
    favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'firefox.desktop', 'telegram-desktop.desktop', 'gitkraken.desktop', 'code.desktop']

    [org/gnome/shell/window-switcher]
    app-icon-mode='both'

    [org/gnome/gedit/preferences/ui]
    show-tabs-mode='auto'

    [org/gnome/gedit/plugins/filebrowser]
    virtual-root='file:///home/tycho/Desktop/nix'
    tree-view=true
    root='file:///'

    [org/gnome/gedit/plugins]
    active-plugins=['time', 'modelines', 'docinfo', 'filebrowser', 'spell']

    [org/gnome/gedit/state/window]
    size=(714, 834)
    state=87168
    bottom-panel-size=140
    side-panel-size=200
    side-panel-active-page='GeditWindowDocumentsPanel'

    [org/gnome/nautilus/preferences]
    search-view='list-view'
    default-folder-viewer='icon-view'
    search-filter-time-type='last_modified'

    [org/gnome/nautilus/window-state]
    sidebar-width=177
    geometry='870x416+798+334'
    maximized=false

    [org/gnome/photos]
    window-position=[480, 221]
    window-maximized=false
    window-size=[960, 600]

    [org/gnome/evolution-data-server]
    network-monitor-gio-name='gio'
    migrated=true

    [org/gnome/desktop/interface]
    clock-show-date=true
    gtk-im-module='gtk-im-context-simple'
    show-battery-percentage=true
    cursor-theme='Paper'
    gtk-theme='Adapta-Nokto'
    icon-theme='Paper-Mono-Dark'

    [org/gnome/desktop/notifications]
    application-children=['firefox', 'gnome-tweak-tool']

    [org/gnome/desktop/notifications/application/gnome-tweak-tool]
    application-id='gnome-tweak-tool.desktop'

    [org/gnome/desktop/notifications/application/firefox]
    application-id='firefox.desktop'

    [org/gnome/desktop/app-folders]
    folder-children=['Utilities', 'Sundry', 'YaST']

    [org/gnome/desktop/app-folders/folders/Utilities]
    translate=true
    categories=['X-GNOME-Utilities']
    apps=['org.gnome.baobab.desktop', 'deja-dup-preferences.desktop', 'eog.desktop', 'evince.desktop', 'org.gnome.FileRoller.desktop', 'gnome-calculator.desktop', 'gnome-dictionary.desktop', 'org.gnome.Characters.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.font-viewer.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Screenshot.desktop', 'gnome-system-log.desktop', 'gnome-system-monitor.desktop', 'gnome-tweak-tool.desktop', 'gucharmap.desktop', 'seahorse.desktop', 'vinagre.desktop', 'yelp.desktop']
    name='X-GNOME-Utilities.directory'

    [org/gnome/desktop/app-folders/folders/Sundry]
    translate=true
    categories=['X-GNOME-Sundry']
    apps=['alacarte.desktop', 'authconfig.desktop', 'ca.desrt.dconf-editor.desktop', 'fedora-release-notes.desktop', 'firewall-config.desktop', 'flash-player-properties.desktop', 'gconf-editor.desktop', 'gnome-abrt.desktop', 'gnome-power-statistics.desktop','ibus-setup-anthy.desktop', 'ibus-setup.desktop', 'ibus-setup-hangul.desktop', 'ibus-setup-libbopomofo.desktop', 'ibus-setup-libpinyin.desktop', 'ibus-setup-m17n.desktop', 'ibus-setup-typing-booster.desktop', 'im-chooser.desktop', 'itweb-settings.desktop', 'jhbuild.desktop', 'javaws.desktop', 'java-1.7.0-openjdk-jconsole.desktop', 'java-1.7.0-openjdk-policytool.desktop', 'log4j-chainsaw.desktop', 'log4j-logfactor5.desktop', 'nm-connection-editor.desktop', 'orca.desktop', 'setroubleshoot.desktop', 'system-config-date.desktop', 'system-config-firewall.desktop', 'system-config-keyboard.desktop', 'system-config-language.desktop', 'system-config-printer.desktop', 'system-config-users.desktop', 'vino-preferences.desktop']
    name='X-GNOME-Sundry.directory'

    [org/gnome/desktop/app-folders/folders/YaST]
    translate=true
    categories=['X-SuSE-YaST']
    name='suse-yast.directory'

    [org/gnome/desktop/screensaver]
    picture-uri='file:///home/tycho/.local/share/shotwell/wallpaper/wallpaper.xml'
    picture-options='zoom'

    [org/gnome/desktop/peripherals/mouse]
    speed=-0.11029411764705888

    [org/gnome/desktop/calendar]
    show-weekdate=false

    [org/gnome/desktop/background]
    picture-uri='file:///home/tycho/.local/share/shotwell/wallpaper/wallpaper.xml'
    show-desktop-icons=true
    picture-options='zoom'

    [org/gnome/desktop/input-sources]
    sources=[('xkb', 'us')]
    xkb-options=['terminate:ctrl_alt_bksp']

    [org/gnome/libgnomekbd/preview]
    width=1464
    height=627
    x=240
    y=135

    [org/gnome/epiphany/state]
    window-position=(749, 353)
    is-maximized=false
    window-size=(720, 612)

    [org/gnome/terminal/legacy/profiles:]
    list=['448452ed-500c-4368-a442-e9d43d21ee4e']
    default='448452ed-500c-4368-a442-e9d43d21ee4e'

    [org/gnome/terminal/legacy/profiles:/:448452ed-500c-4368-a442-e9d43d21ee4e]
    visible-name='Default'

    [org/gnome/terminal/legacy]
    schema-version=uint32 3

    [org/gnome/software]
    check-timestamp=int64 1529832528

    [org/gnome/Totem]
    subtitle-encoding='UTF-8'
    active-plugins=['apple-trailers', 'recent', 'screenshot', 'screensaver', 'save-file', 'autoload-subtitles', 'movie-properties', 'media_player_keys', 'skipto', 'vimeo', 'variable-rate']

    [org/gtk/settings/file-chooser]
    sort-column='name'
    sidebar-width=174
    window-position=(2278, 47)
    show-size-column=false
    show-hidden=true
    window-size=(1203, 936)
    sort-directories-first=false
    date-format='regular'
    sort-order='ascending'
    location-mode='path-bar'

    [org/yorba/shotwell/preferences/ui]
    sidebar-position=180
    display-sidebar=true
    display-basic-properties=true
    display-photo-tags=true
    display-event-comments=false
    display-search-bar=false
    display-photo-titles=false
    show-welcome-dialog=false
    display-photo-ratings=true
    events-sort-ascending=false
    library-photos-sort-by=2
    library-photos-sort-ascending=false
    display-photo-comments=false

    [org/yorba/shotwell/preferences/window]
    library-height=768
    library-maximize=false
    library-width=1024

  '';

}
