{ config, pkgs, ... }:

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
      vistafonts
    ];
  };

}
