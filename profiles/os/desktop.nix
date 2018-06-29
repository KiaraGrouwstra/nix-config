{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  environment.systemPackages = with master; [
    wmctrl
  ];

  # X11 windowing system
  services.xserver = {
    enable = true;
    # enableCtrlAltBackspace = true;
    layout = "us";
    videoDrivers = [ "intel" "nvidiaBeta" "nvidia" "ati" "cirrus" "vesa" "vmware" "modesetting" ];

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

    # TODO: try window managers
    windowManager = {
      # i3
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
      default = "i3";

      # awesome

      # # xmonad
      # xmonad.enable = true;
      # xmonad.enableContribAndExtras = true;
      # default = "xmonad";
    };

  };

}
