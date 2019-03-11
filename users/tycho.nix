# https://github.com/ghuntley/dotfiles-nixos/blob/master/users/ghuntley.nix

{ lib, pkgs, ... }: # config, 
with lib;

let secrets = import ../secrets.nix;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tycho = {
    uid = 1000;
    isNormalUser = true;
    home = "/home/tycho";
    description = "Tycho Grouwstra <tychogrouwstra@gmail.com>";
    # password = secrets.password;
    hashedPassword = secrets.hashedPassword;

    shell = pkgs.fish;

    extraGroups = [
      "audio"
      "docker"
      # "libvirtd"
      "networkmanager"
      "users"
      "vboxusers"
      "video"
      "wheel"
    ];

  };

  environment.variables.DEFAULT_USER = "tycho";

  # system.activationScripts =
  # {

  #   # Configure various dotfiles.
  #   dotfiles = stringAfter [ "users" ]
  #   (''
  #     # binDir=/run/current-system/sw/bin/
  #     # for file in $(ls $bindir); do
  #     #   [ ! -f $bindir$file ] && ln -s $bindir$file /bin/$file
  #     # done
  #     # ln -s /run/current-system/sw/bin/nvim /bin/vi

  #     function sha { sha256sum `realpath $1` | head -c 64; }

  #     function syncFiles {
  #       repoPath=$1
  #       localPath=$2
  #       mode=$3
  #       nixPath="/etc/nixos/$repoPath"
  #       i=`expr length "$nixPath"`
  #       for file in $(find $nixPath); do
  #         local="$localPath$'' + ''{file:$i:1000}"
  #         if [ -d "$file" ] && [ "$local" ] && [ ! -d "$local" ]; then
  #           echo "sudo mkdir -p $local"
  #         elif [ -f "$file" ] && [ -f "$local" ]; then
  #           sha1=`sha $file`
  #           sha2=`sha $local`
  #           if [ "$sha1" != "$sha2" ]; then
  #             if [[ $mode =~ ^up$ ]]; then
  #               echo "sudo cp $file $local"
  #             elif [[ $mode =~ ^down$ ]]; then
  #               echo "sudo cp $local $file"
  #             fi
  #           fi
  #         elif [ -f "$file" ] && [ ! -f "$local" ]; then
  #           echo "sudo cp $file $local"
  #         fi
  #       done
  #       echo "sudo cp -r $nixPath/. ./$repoPath/"
  #     }
    
  #     function syncFolders {
  #         echo
  #         echo "###### $1 ######"
  #         echo
  #         syncFiles "dotfiles" "/home/tycho" "$1"
  #         syncFiles "public" "" "$1"
  #         syncFiles "private" "" "$1"
  #         echo
  #     }

  #     echo
  #     syncFolders "down"
  #     syncFolders "up"
  #     echo
  #     echo "git status"
  #     echo
  #   '');
  # };

}
