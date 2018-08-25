# { pkgs, ... }:

{
  _module.args.pkgs = import /drogon/Coding/nix/nixpkgs {};
  boot.loader.systemd-boot.enable = true;
  nix.buildCores = 4;
  imports = [./hardware-configuration.nix];

  # environment.systemPackages = with pkgs; [
  #   # cabal-install
  #   # stack
  #   # ghc
  #   # haskell.compiler.ghc822
  #   # haskell.compiler.ghc843
  #   haskellPackages.intero
  # ];

}

