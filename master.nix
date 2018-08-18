# nix-prefetch-url --unpack URL
let
rev = "aa5a93e21d77e2c2464b39a5f4dabbfebfb225b4";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "0m9fm8y7xn376bf4vnircacwfni0kr5vr6y24867didc468xyqw5";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
