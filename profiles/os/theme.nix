{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    adapta-kde-theme
    adapta-gtk-theme
    paper-icon-theme
    # Albatross
    arc-theme
    # Blackbird
    clearlooks-phenix
    e17gtk
    # elementary-gtk-theme
    gnome-breeze
    greybird
    # gtk-engines
    theme-jade1
    # theme-jade2
    materia-theme
    numix-solarized-gtk-theme
    numix-sx-gtk-theme
    numix-gtk-theme
    theme-obsidian2
    onestepback
    orion
    paper-gtk-theme
    plano-theme
    theme-vertex
    zuki-themes
  ];

}
