# nix-prefetch-url --unpack URL
let
rev = "5828cb3af7ee2ebe7dc460f778dc2300259ea7c4";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "0p46vg4af884z8kpiq99zcrhq6al7rpmlm7zqwddakmrjww22lax";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
