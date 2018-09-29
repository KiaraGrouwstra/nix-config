{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    adapta-kde-theme
    paper-icon-theme
    # Albatross
    arc-theme
    # Blackbird
    clearlooks-phenix
    e17gtk
    greybird
    theme-jade1
    # theme-jade2
    materia-theme
    theme-obsidian2
    onestepback
    orion
    plano-theme
    theme-vertex
    zuki-themes
  ];

}
