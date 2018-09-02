# { pkgs, ... }:

{
  services.ihaskell = {
    enable = true;
    extraPackages = self: [ # with pkgs.haskellPackages; [
    ];
  };
}
