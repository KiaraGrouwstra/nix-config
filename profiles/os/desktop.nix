{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wmctrl
    wine
    appimage-run
    appimagekit
    squashfsTools
  ];

  # X11 windowing system
  services.xserver = {
    enable = true;
    # enableCtrlAltBackspace = true;
    layout = "us";
    videoDrivers = [ "intel" "ati" "cirrus" "vesa" "vmware" "modesetting" ];
    # "nvidiaBeta" "nvidia"

    # check current versions: nix-store -q --references /run/current-system/sw
    # try build: nix-build -A gnome3
    # install: nix-env -f . -iA gnome3
    desktopManager.gnome3.enable = true;
    displayManager.gdm.enable = true;

  };

  # DBus is needed for e.g. Gnome GSConnect extension
  services.dbus.socketActivated = true;

}
