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
          if [ "$sha1" != "$sha2" ]; then
            echo "differences found for $local ($sha2) <-> $file ($sha1):"
            echo "sudo diff $file $local"  # not available :(
            read -p "override/upstream/skip $local? (o/u/s) " -n 1 -r
            echo # (\n)
            if [[ $REPLY =~ ^[Oo]$ ]]; then
              echo "\nsudo cp $file $local\n"
            elif [[ $REPLY =~ ^[Uu]$ ]]; then
              echo "\nsudo cp $local $file\n"
            fi
          fi
        fi
      done
    '');
  };

}
