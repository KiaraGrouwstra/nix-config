# nix-prefetch-url --unpack URL
let
  rev = "3afef4a3da247330a3ab10f7839cbe6b6e33aaf6";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "088xwwv5m5p0hnzpvvvc013p1bnwaamn97ph9ah49fdmfajkp7ia";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
