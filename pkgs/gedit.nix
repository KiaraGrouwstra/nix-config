{ pkgs, ... }:

{

  # services.xserver.desktopManager.gnome3.extraGSettingsOverridePackages
  extraGSettingsOverridePackages = (with pkgs; [
    gnome3.gedit
  ]);

}
