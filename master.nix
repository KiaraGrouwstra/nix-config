# nix-prefetch-url --unpack URL
let
  rev = "2c1e736ae8ea308cecc6b6f2cf44638280393363";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "10sf47fcgsas2i5qv8h0x9sw6c2qv99d1qghg9qqw2zzbbsvbphh";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
