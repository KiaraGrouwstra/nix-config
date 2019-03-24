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
    # try build: nix-build -A wget
    # install: nix-env -f . -iA wget

    desktopManager = {
      plasma5.enable = true;
      gnome3.enable = true;
      # enlightenment.enable = true;
      # kodi.enable = true;
      # lumina.enable = true;
      # lxqt.enable = true;
      # mate.enable = true;
      # maxx.enable = true;
      # xfce.enable = true;
      # xterm.enable = true;
    };

    displayManager = {
      sddm.enable = true;
      # gdm.enable = true;
      # lightdm.enable = true;
      # slim.enable = true;
      # xpra.enable = true;
    };

    windowManager = {
      i3.enable = true;
      default = "i3";
    };

  };

}
