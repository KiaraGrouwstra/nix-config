{ pkgs, ... }:

let
  secrets = import ./secrets.nix;
in
{
  environment.systemPackages = [pkgs.git];

  users.extraUsers.tycho = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/tycho";
    hashedPassword = secrets.hashedPassword;

    extraGroups = [
      "networkmanager"
      "users"
      "wheel"
    ];

  };

}
