{ pkgs, ... }:

{

  # X11 windowing system
  services.xserver = {
    enable = true;
    # enableCtrlAltBackspace = true;
    layout = "us";
    videoDrivers = [ "intel" ];  # TODO: "nvidia"

    # TODO: upgrade
    desktopManager.gnome3.enable = true;
    displayManager.gdm.enable = true;

    # https://nixos.wiki/wiki/Keyboard_Layout_Customization
    # vi "$(nix-build --no-out-link '<nixpkgs>' -A xorg.xkeyboardconfig)/etc/X11/xkb/rules/base.lst"
    # xkbModel = "pc104";
    # xkbVariant = "colemak";
    # xkbOptions = "caps:backspace"; # compose:caps,menu:ralt

    # TODO: try window managers
    windowManager = {
      # i3
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
      default = "i3";

      # # xmonad
      # xmonad.enable = true;
      # xmonad.enableContribAndExtras = true;
      # default = "xmonad";
    };

  };

}
