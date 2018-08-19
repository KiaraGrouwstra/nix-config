{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  environment.systemPackages = with master; [
    wmctrl
    wine
    appimage-run
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

    # https://nixos.wiki/wiki/Keyboard_Layout_Customization
    # vi "$(nix-build --no-out-link '<nixpkgs>' -A xorg.xkeyboardconfig)/etc/X11/xkb/rules/base.lst"
    # xkbModel = "pc104";
    # xkbVariant = "colemak";  # this seems to work only during login, before entering the desktop
    xkbOptions = "caps:backspace"; # compose:caps,menu:ralt

  };

}
