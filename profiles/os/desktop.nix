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
    videoDrivers = [ "nvidiaBeta" "intel" "ati" "cirrus" "vesa" "vmware" "modesetting" ];
    # "nvidia"

    # check current versions: nix-store -q --references /run/current-system/sw
    # try build: nix-build -A wget
    # install: nix-env -f . -iA wget
    # desktopManager.plasma5.enable = true;
    # displayManager.sddm.enable = true;
    desktopManager.gnome3.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };

    windowManager.default = "i3";
    windowManager.i3.enable = true;
  };

  # # DBus is needed for e.g. Gnome GSConnect extension
  # services.dbus.socketActivated = true;

}
