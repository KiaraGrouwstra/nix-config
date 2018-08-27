# nix-prefetch-url --unpack URL
let
  rev = "9236e9a28d1e084d54ef973ea79cca4156d11347";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "0pi13h05pcyb0xvw30jg9gy4pzrzxyzbr583m5mzrsb7izma08kf";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
