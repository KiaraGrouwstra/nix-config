{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    thefuck
    lolcat
    figlet
    beep
    tldr
    neovim
    xbindkeys
    service-wrapper
    syslinux
    bcachefs-tools
    mutt
    neomutt
    zip
    unrar
    rxvt_unicode  # rxvt_unicode-with-plugins
    i3-gaps
    i3blocks-gaps
    i3status
    xclip
    git-lfs
    pmutils
    exa
    xorg.xbacklight

    kdeconnect
    latte-dock
    mimic
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
    ktouch    # touch typing
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
    kleopatra
    gnupg

    # nix / disk
    ncdu
    nix-du

    # password managers
    # pkgs.1password
    keepass
    keepassx
  ];
}
