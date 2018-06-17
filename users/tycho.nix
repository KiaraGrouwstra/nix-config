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

  environment.variables.DEFAULT_USER = "tycho";

  system.activationScripts =
  {
    # Configure various dotfiles.
    dotfiles = stringAfter [ "users" ]
    ''
      function sha { sudo sha256sum `realpath $1` | head -c 64; }
      path="/etc/nixos/dotfiles"
      for file in $(sudo find $path); do
        local=`echo "$file" | sed -e "s|$path|/home/tycho|"`
        if [ -f "$file" ] && [ -f "$local" ]; then
          sha1=`sha $file`
          sha2=`sha $local`
          if [ "$sha1" = "$sha2" ]; then
            echo "matching SHA, skip: $local"
          else
            echo "differences found for $local <-> $file:"
            diff "$file" "$local"
            read -p "override/upstream/skip $local? (o/u/s) " -n 1 -r
            echo # (\n)
            if [[ $REPLY =~ ^[Yy]$ ]]; then
              echo "overriding $local..."
              sudo cp $file $local
            elif [[ $REPLY =~ ^[Uu]$ ]]; then
              echo "upstreaming $local..."
              sudo cp $local $file
            else
              echo "skipping $local..."
            fi
          fi
        fi
      done
    '';
  };

}
