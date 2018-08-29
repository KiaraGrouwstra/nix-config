# /home/tycho/Desktop/nixpkgs
let
  rev = "2c1e736ae8ea308cecc6b6f2cf44638280393363";
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = "10sf47fcgsas2i5qv8h0x9sw6c2qv99d1qghg9qqw2zzbbsvbphh";
  };
in
  # source: http://www.haskellforall.com/2018/08/nixos-in-production.html
  # import /drogon/Coding/nix/nixpkgs {
  import "${nixpkgs}/nixos" {
    configuration = {
      imports = [
        # /etc/nixos/configuration.nix
        # error "unsupported attribute `pkgs'", while the only difference is these import paths...
        ./hardware-configuration.nix
        ./configuration-common.nix
        ./machines/klink.nix
      ];
    };
  }
