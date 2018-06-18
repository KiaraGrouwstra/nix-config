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
    (''
      function sha { sha256sum `realpath $1` | head -c 64; } 
      path="/etc/nixos/dotfiles"
      i=`expr length "$path"`
      for file in $(find $path); do
        local="/home/tycho$'' + ''{file:$i:1000}"
        if [ -f "$file" ] && [ -f "$local" ]; then
          sha1=`sha $file`
          sha2=`sha $local`
          echo $file
          echo $local
          echo $sha1
          echo $sha2
          if [ "$sha1" = "$sha2" ]; then
            echo "matching SHA, skip: $local"
          else
            echo "differences found for $local ($sha2) <-> $file ($sha1):"
            echo "sudo diff $file $local"  # not available :(
            read -p "override/upstream/skip $local? (o/u/s) " -n 1 -r
            echo # (\n)
            if [[ $REPLY =~ ^[Yy]$ ]]; then
              echo "overriding $local..."
              cmd="cp $file $local"
              echo $cmd
              $cmd
            elif [[ $REPLY =~ ^[Uu]$ ]]; then
              echo "upstreaming $local..."
              cmd="cp $local $file"
              echo $cmd
              $cmd
            else
              echo "skipping $local..."
            fi
          fi
        fi
      done
    '');
  };

}
