{ pkgs, ... }:

{

  # services.xserver.desktopManager.gnome3.extraGSettingsOverridePackages
  extraGSettingsOverridePackages = (with pkgs; [
    gnome3.gedit
  ]);

  # services.xserver.desktopManager.gnome3.extraGSettingsOverrides
  extraGSettingsOverrides = ''

    # gedit

    [org.gnome.gedit.preferences.editor]
    auto-indent=true
    bracket-matching=true
    create-backup-copy=false
    display-line-numbers=true
    highlight-current-line=true
    insert-spaces=true
    tabs-size=4

  '';

}
