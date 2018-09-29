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
    videoDrivers = [ "nvidiaBeta" "nvidia" "intel" "ati" "cirrus" "vesa" "vmware" "modesetting" ];

    # check current versions: nix-store -q --references /run/current-system/sw
    # try build: nix-build -A wget
    # install: nix-env -f . -iA wget
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;

  };

}
