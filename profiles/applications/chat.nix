{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    tdesktop  # telegram
      # - theme: set manually at Telegram -> settings -> Chat background -> Choose from file -> /nix/store/*-adapta-gtk-theme-*/share/themes/Adapta-Nokto/telegram/
      # - plaintext config: https://github.com/telegramdesktop/tdesktop/issues/4879
      # - use system fonts: https://github.com/telegramdesktop/tdesktop/issues/90
      # - CJK fonts: https://github.com/telegramdesktop/tdesktop/issues/3575
    slack
    weechat
    zoom-us
    franz
    discord
    skypeforlinux
    telegram-cli
    signal-desktop
  ];


}
