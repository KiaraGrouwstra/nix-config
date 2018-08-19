# see `nixos-help`, https://nixos.org/nixos/options.html
# https://github.com/ghuntley/dotfiles-nixos/blob/master/configuration-common.nix

# Most of the configuration is in here. This configuration is common to both
# conventional NixOS installs (see nixos-install) and NixOS installed by
# Nixops. For configuration specific to conventional installs and Nixops
# installs, see ./configuration.nix and ./nixops.nix respectively.

{ config, lib, pkgs, ... }:
with lib;

{
  imports = [
    # Import default packages.
    ./profiles/default.nix

    # Import default services.
    ./services/default.nix
    
    # Create user accounts 
    ./users/tycho.nix
  ];

  # Allow proprietary software (such as the NVIDIA drivers).
  nixpkgs.config.allowUnfree = true;

  boot = {

    # See console messages during early boot.
    initrd.kernelModules = [ "fbcon" ];

    # Disable console blanking after being idle.
    kernelParams = [ "consoleblank=0" ];
 
    # Clean /tmp on boot
    cleanTmpDir = true;

  };
 
  # automatic updates every day
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # automatic gc
  nix.gc = {
    automatic = true;
    dates = "03:15";
    options = "--delete-older-than 30d";
  };

  security.sudo.enable = true;

  # Disable displaying the NixOS manual in a virtual console.
  services.nixosManual.showManual = false;

  # Disable the infamous systemd screen/tmux killer
  services.logind.extraConfig = ''
    KillUserProcesses=no
  '';

  # Increase the amount of inotify watchers
  # Note that inotify watches consume 1kB on 64-bit machines.
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches"   = 1048576;   # default:  8192
    "fs.inotify.max_user_instances" =    1024;   # default:   128
    "fs.inotify.max_queued_events"  =   32768;   # default: 16384
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    # consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
