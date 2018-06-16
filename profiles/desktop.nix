{ pkgs, ... }:

{

  # X11 windowing system
  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;
    layout = "us";
    videoDrivers = [ "intel" ];  # TODO: "nvidia"

    desktopManager.gnome3.enable = true;

    displayManager = {
      gdm.enable = true;
      # sddm.enable = true;
      # slim.defaultUser = "tycho";
      # sessionCommands = "i3status &";
    };

    windowManager = {
      # # i3
      # i3.enable = true;
      # i3.package = pkgs.i3-gaps;
      # default = "i3";

      # # xmonad
      # xmonad.enable = true;
      # xmonad.enableContribAndExtras = true;
      # default = "xmonad";
    };

  };

}
