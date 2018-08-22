# nix-prefetch-url --unpack URL
let
  rev = "090985a443d3801f2ed04e85c8319ffe591dc96c";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "0vh744hwfkgrva7p9jhcph4p1y0xb2az86xnwbag11pn6w0z6r6h";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
