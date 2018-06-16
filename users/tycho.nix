# https://github.com/ghuntley/dotfiles-nixos/blob/master/users/ghuntley.nix

{ config, lib, pkgs, ... }:
with lib;

let secrets = import ../secrets.nix;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.tycho = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/tycho";
    description = "Tycho Grouwstra <tychogrouwstra@gmail.com>";
    openssh.authorizedKeys.keys = secrets.sshKeys;
    hashedPassword = secrets.hashedPassword;

    shell = pkgs.fish;

    group = "";
    extraGroups = [
      "audio"
      "docker"
      # "libvirtd"
      "networkmanager"
      "users"
      # "vboxusers"
      "video"
      "wheel"
    ];

  };

  time.timeZone = "Europe/Amsterdam";

  i18n = {
    inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [ mozc hangul ];
    };
  };

  environment.variables.DEFAULT_USER = "tycho";

  system.activationScripts =
  {
    # Configure various dotfiles.
    dotfiles = stringAfter [ "users" ]
    ''
      cp -r /etc/nixos/dotfiles/. /home/tycho
    '';
  };

}
