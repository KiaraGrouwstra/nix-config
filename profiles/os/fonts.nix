{ pkgs, ... }:

{

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      powerline-fonts  # used in oh-my-* themes
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      terminus_font  # for hidpi screens, large fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      dejavu_fonts
      emojione  # emoji
      fira-code
      font-awesome-ttf  # icons
      proggyfonts
      powerline-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      # vistafonts
      ipafont # jp
      kochi-substitute # jp
    ];
  };

  # Enable the "ultimate" font config.  This enables a few extra options to
  # make sure fonts look nice.  However, if you enable this and fonts look
  # strange, try disabling it.
  fonts.fontconfig.ultimate.enable = true;
  
  # These settings enable default fonts for your system.  This setting is very
  # important.  It lets fontconfig know that you want to fall back to a Japanese
  # font (for example "IPAGothic") if an application tries to show fonts with
  # Japanese.  For instance, this is important if you are using a terminal
  # emulator and you `cat` some Japanese text to the screen. If you don't have
  # "defaultFonts" configured, fontconfig will pick a random Japanese font to
  # use.  If you have this "defaultFonts" setting configured, fontconfig will
  # pick the font you have selected.  This makes sure Japanese fonts look nice.
  fonts.fontconfig.defaultFonts = {
    monospace = [
      "DejaVu Sans Mono"
      "IPAGothic"
    ];
    sansSerif = [
      "DejaVu Sans"
      "IPAPGothic"
    ];
    serif = [
      "DejaVu Serif"
      "IPAPMincho"
    ];
  };

}
