{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    chrome-gnome-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.system-monitor
    gnomeExtensions.topicons-plus
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
  ];

  services.gnome3.chrome-gnome-shell.enable = true;

  # `dconf dump /`
  # `dconf watch /`
  # installed: ~/.local/share/app-info/xmls/extensions-web.xml
  # use `dconf watch /` then change stuff in gnome tweak tool
  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''


    [org/gnome/settings-daemon/plugins/power]
    sleep-inactive-battery-type='nothing'
    sleep-inactive-ac-timeout=3600
    sleep-inactive-ac-type='nothing'
    sleep-inactive-battery-timeout=1800

    [org/gnome/settings-daemon/plugins/color]
    night-light-enabled=true

    [org/gnome/settings-daemon/plugins/xsettings]
    antialiasing='grayscale'
    hinting='slight'

    [org/gnome/settings-daemon/peripherals/keyboard]
    numlock-state='off'

    [org/gnome/shell]
    app-picker-view=uint32 1
    enabled-extensions=['windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com','launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'alternate-tab@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'TopIcons@phocean.net', 'emoji-selector@maestroschan.fr', 'gsconnect@andyholmes.github.io']
    had-bluetooth-devices-setup=true
    favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'firefox.desktop', 'telegram-desktop.desktop', 'gitkraken.desktop', 'code.desktop', 'org.gnome.Terminal.desktop', 'webtorrent-desktop.desktop']

    [org/gnome/shell/extensions/system-monitor]
    compact-display=false
    show-tooltip=false

    [org/gnome/shell/extensions/user-theme]
    name='Adapta-Nokto'

    [org/gnome/shell/extensions/dash-to-dock]
    preferred-monitor=0
    multi-monitor=false
    height-fraction=0.90000000000000002
    dash-max-icon-size=64
    icon-size-fixed=true

    [org/gnome/shell/extensions/gsconnect]
    webbrowser-integration=true
    nautilus-integration=true
    show-battery=true
    public-name='klink'
    devices=['4e1d527e34787c90']
    show-indicators=true

    [org/gnome/shell/extensions/gsconnect/device/4e1d527e34787c90]
    supported-plugins=['battery', 'clipboard', 'findmyphone', 'mousepad', 'mpris', 'notification', 'ping', 'runcommand', 'sftp', 'share', 'telephony']
    enabled-plugins=['battery', 'clipboard', 'findmyphone', 'sftp', 'mpris', 'ping', 'mousepad', 'notification', 'telephony', 'share', 'runcommand']
    type='phone'
    tcp-port=uint32 1716
    id='4e1d527e34787c90'
    name='google'
    tcp-host='192.168.2.4'

    [org/gnome/shell/extensions/gsconnect/device/4e1d527e34787c90/plugin/battery]
    send-statistics=true

    [org/gnome/shell/extensions/gsconnect/device/4e1d527e34787c90/plugin/telephony]
    ringing-pause=false

    [org/gnome/shell/extensions/gsconnect/device/4e1d527e34787c90/plugin/sftp]
    automount=true

    [org/gnome/shell/extensions/gsconnect/device/4e1d527e34787c90/plugin/share]
    download-subdirectory=true
    download-directory='/drogon/dl'

    [org/gnome/shell/extensions/gsconnect/device/4e1d527e34787c90/plugin/notification]
    applications='{"GSConnect":{"iconName":"phone","enabled":false},"Firefox":{"iconName":"firefox","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Google Chrome":{"iconName":"google-chrome","enabled":true},"Software":{"iconName":"org.gnome.Software","enabled":true},"Tweaks":{"iconName":"org.gnome.tweaks","enabled":true},"Text Editor":{"iconName":"gedit","enabled":true},"Shell Extensions":{"iconName":"application-x-executable","enabled":true},"Packages":{"iconName":"system-software-install","enabled":true},"Archive Manager":{"iconName":"file-roller","enabled":true},"Banner Designer":{"iconName":"org.gnome.Software","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Evolution":{"iconName":"evolution","enabled":true},"Desktop Sharing":{"iconName":"preferences-desktop-remote-desktop","enabled":true},"Package Updater":{"iconName":"system-software-update","enabled":true}}'

    [org/gnome/shell/extensions/topicons]
    tray-pos='right'

    [org/gnome/shell/window-switcher]
    app-icon-mode='both'

    [org/gnome/charmap/window-state]
    maximized=false

    [org/gnome/calculator]
    show-zeroes=false
    show-thousands=false
    button-mode='basic'
    target-units='radian'
    word-size=64
    number-format='automatic'
    angle-units='degrees'
    base=10
    source-units='degree'
    accuracy=9

    [org/gnome/gedit/preferences/ui]
    show-tabs-mode='auto'

    [org/gnome/gedit/plugins/filebrowser]
    virtual-root='file:///home/tycho/Desktop'
    tree-view=true
    root='file:///'

    [org/gnome/gedit/plugins]
    active-plugins=['time', 'modelines', 'docinfo', 'filebrowser', 'spell']

    [org/gnome/gedit/state/window]
    bottom-panel-size=140
    side-panel-size=200
    side-panel-active-page='GeditWindowDocumentsPanel'

    [org/gnome/nautilus/preferences]
    search-view='list-view'
    default-folder-viewer='icon-view'
    search-filter-time-type='last_modified'

    [org/gnome/nautilus/window-state]
    maximized=false

    [org/gnome/file-roller/listing]
    sort-method='name'
    sort-type='ascending'
    list-mode='as-folder'
    show-path=false

    [org/gnome/file-roller/dialogs/extract]
    skip-newer=false
    recreate-folders=true

    [org/gnome/evolution-data-server]
    network-monitor-gio-name='gio'
    migrated=true

    [org/gnome/power-manager]
    info-history-type='charge'
    info-stats-type='discharge-accuracy'
    info-last-device='wakeups'
    info-page-number=3

    [org/gnome/desktop/interface]
    clock-show-date=true
    gtk-im-module='gtk-im-context-simple'
    show-battery-percentage=true
    cursor-theme='Paper'
    gtk-theme='Adapta-Nokto-Eta'
    icon-theme='Paper'

    [org/gnome/desktop/notifications]
    application-children=['firefox', 'gnome-tweak-tool', 'org-gnome-nautilus', 'google-chrome', 'org-gnome-software', 'org-gnome-tweaks', 'org-gnome-gedit', 'gnome-shell-extension-prefs', 'org-gnome-shell-extensions-gsconnect']

    [org/gnome/desktop/notifications/application/org-gnome-tweaks]
    application-id='org.gnome.tweaks.desktop'

    [org/gnome/desktop/notifications/application/org-gnome-nautilus]
    application-id='org.gnome.Nautilus.desktop'

    [org/gnome/desktop/notifications/application/google-chrome]
    application-id='google-chrome.desktop'

    [org/gnome/desktop/notifications/application/firefox]
    application-id='firefox.desktop'

    [org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect]
    application-id='org.gnome.Shell.Extensions.GSConnect.desktop'

    [org/gnome/desktop/notifications/application/gnome-shell-extension-prefs]
    application-id='gnome-shell-extension-prefs.desktop'

    [org/gnome/desktop/notifications/application/org-gnome-software]
    application-id='org.gnome.Software.desktop'

    [org/gnome/desktop/notifications/application/org-gnome-gedit]
    application-id='org.gnome.gedit.desktop'

    [org/gnome/desktop/notifications/application/gnome-tweak-tool]
    application-id='gnome-tweak-tool.desktop'

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
    apps=['alacarte.desktop', 'authconfig.desktop', 'ca.desrt.dconf-editor.desktop', 'fedora-release-notes.desktop', 'firewall-config.desktop', 'flash-player-properties.desktop', 'gconf-editor.desktop', 'gnome-abrt.desktop', 'gnome-power-statistics.desktop', 'ibus-setup-anthy.desktop', 'ibus-setup.desktop', 'ibus-setup-hangul.desktop', 'ibus-setup-libbopomofo.desktop', 'ibus-setup-libpinyin.desktop', 'ibus-setup-m17n.desktop', 'ibus-setup-typing-booster.desktop', 'im-chooser.desktop', 'itweb-settings.desktop', 'jhbuild.desktop', 'javaws.desktop', 'java-1.7.0-openjdk-jconsole.desktop', 'java-1.7.0-openjdk-policytool.desktop', 'log4j-chainsaw.desktop', 'log4j-logfactor5.desktop', 'nm-connection-editor.desktop', 'orca.desktop', 'setroubleshoot.desktop', 'system-config-date.desktop', 'system-config-firewall.desktop', 'system-config-keyboard.desktop', 'system-config-language.desktop', 'system-config-printer.desktop', 'system-config-users.desktop', 'vino-preferences.desktop']
    name='X-GNOME-Sundry.directory'

    [org/gnome/desktop/app-folders/folders/YaST]
    translate=true
    categories=['X-SuSE-YaST']
    name='suse-yast.directory'

    [org/gnome/desktop/screensaver]
    lock-delay=1800
    picture-uri='file:///home/tycho/.local/share/shotwell/wallpaper/wallpaper.xml'
    picture-options='zoom'
    lock-enabled=false

    [org/gnome/desktop/peripherals/touchpad]
    speed=1.0
    edge-scrolling-enabled=false
    two-finger-scrolling-enabled=true
    tap-to-click=true

    [org/gnome/desktop/peripherals/mouse]
    natural-scroll=true
    speed=1.0
    accel-profile='flat'

    [org/gnome/desktop/calendar]
    show-weekdate=false

    [org/gnome/desktop/session]
    idle-delay=uint32 900

    [org/gnome/desktop/wm/keybindings]
    switch-input-source=['<Super>space', '<Alt>Shift_L']

    [org/gnome/desktop/sound]
    allow-volume-above-100-percent=true

    [org/gnome/desktop/background]
    picture-uri='file:///home/tycho/.local/share/shotwell/wallpaper/wallpaper.xml'
    show-desktop-icons=true
    picture-options='zoom'

    [org/gnome/desktop/input-sources]
    show-all-sources=false
    sources=[('xkb', 'us'), ('xkb', 'us+colemak')]
    xkb-options=['terminate:ctrl_alt_bksp']

    [org/gnome/control-center]
    last-panel='region'

    [org/gnome/epiphany/state]
    is-maximized=false

    [org/gnome/photos]
    window-maximized=false

    [org/gnome/terminal/legacy/profiles:]
    list=['448452ed-500c-4368-a442-e9d43d21ee4e']
    default='448452ed-500c-4368-a442-e9d43d21ee4e'

    [org/gnome/terminal/legacy/profiles:/:448452ed-500c-4368-a442-e9d43d21ee4e]
    visible-name='Default'

    [org/gnome/terminal/legacy]
    schema-version=uint32 3

    [org/gnome/nm-applet/eap/53118008-3395-4f31-aa13-ced09c92636a]
    ignore-phase2-ca-cert=false
    ignore-ca-cert=false

    [org/gnome/Totem]
    subtitle-encoding='UTF-8'
    active-plugins=['apple-trailers', 'recent', 'screenshot', 'screensaver', 'save-file', 'autoload-subtitles', 'movie-properties', 'media_player_keys', 'skipto', 'vimeo', 'variable-rate']

    [org/gnome/gnome-system-monitor]
    current-tab='processes'
    show-whose-processes='user'
    maximized=false
    show-dependencies=false
    cpu-colors=[(uint32 0, '#FF6E00'), (1, '#CB0C29'), (2, '#49A835'), (3, '#2D7DB3'), (4, '#f25915e815e8'), (5, '#f25915e815e8'), (6, '#f25915e815e8'), (7, '#f25915e815e8')]

    [org/gnome/gnome-system-monitor/proctree]
    columns-order=[0, 1, 2, 3, 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,23, 24, 25, 26]
    sort-order=0
    sort-col=0

    [org/gnome/gnome-system-monitor/disktreenew]
    col-6-visible=true
    col-6-width=0

    [org/gnome/software]
    first-run=false

    [org/gnome/mutter]
    overlay-key='Super_L'

    [org/gtk/settings/file-chooser]
    sort-column='name'
    sidebar-width=174
    show-size-column=true
    show-hidden=true
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
    direct-maximize=false
    direct-height=768
    direct-width=1024
    library-height=768
    library-width=1024
    library-maximize=false

    [ca/desrt/dconf-editor]
    saved-view='/org/gnome/desktop/applications/terminal/'
    show-warning=false
    window-height=600
    window-width=800
    window-is-maximized=false

  '';

}
