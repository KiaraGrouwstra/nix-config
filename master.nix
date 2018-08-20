# nix-prefetch-url --unpack URL
let
  rev = "8f6a72d25b4c7e582883e2b18c3df7811be6eb08";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "02drcvdd6l089af5w9vbhc72dyv4vlvn5iqxalrbp5p8333mr9ss";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
