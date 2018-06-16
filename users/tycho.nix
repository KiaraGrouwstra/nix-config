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
    initialPassword = "password";
    # # TODO: include password -- blocker for `mutableUsers = false`
    # hashedPassword = secrets.hashedPassword;

    shell = pkgs.fish;

    group = "";
    extraGroups = [
      "audio"
      "docker"
      "libvirtd"
      "networkmanager"
      "users"
      "vboxusers"
      "video"
      "wheel"
    ];

  };

  time.timeZone = "Europe/Amsterdam";

  security = {
    sudo = {
      enable = true;
      configFile = "tycho ALL=(ALL) NOPASSWD: ALL";
    };
  };

  i18n = {
    # https://en.wikipedia.org/wiki/ISO/IEC_8859-15
    consoleKeyMap = "colemak/en-latin9";
    inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [ mozc hangul ];
    };
  };

  environment.variables.DEFAULT_USER = "tycho";

  system.activationScripts =
  {
    # TODO: figure out dotfiles
    # Configure various dotfiles.
    dotfiles = stringAfter [ "users" ]
    ''
      cd /home/tycho
    '';
  };

}
