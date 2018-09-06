{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    thefuck
    lolcat
    figlet
    beep
    tldr
    xbindkeys
    service-wrapper
    kdeconnect
    latte-dock
    kdeApplications.spectacle # screenshots
    kdeApplications.okular    # pdf
    evince
    # granatier # bomberman
    # kmines    # minesweeper
    konversation  # irc
    kdeApplications.akregator # rss
    # sheets    # excel
    # kexi      # DBs/Access
    kile      # latex
    # cantor    # math
    # kalgebra  # graph calc
    # kmplot    # plotter
    # ktouch    # touch typing
    # labplot   # plotter
    minuet    # music
    kcalc     # calc
    # kcharselect # char
    # kmouth    # speech synthesizer
    # simon     # speech recognition
    ark       # archiver
    # ksnapshot # screenshots
    amarok    # audio
    # dragonplayer  # video
    # juk       # music
    # kaffeine  # media
    kmplayer  # media

    # nix / disk
    ncdu
    nix-du

    # password managers
    # pkgs.1password
    keepass
    keepassx
  ];
}
