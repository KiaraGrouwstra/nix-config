# # nix-prefetch-url --unpack URL
# let
# rev = "1d417c39f0200bcf9eed95b428faf3e1bc0802ee";
# in
# import (fetchTarball {
#   url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
#   sha256 = "0dd633kz855apa08y1k124816i10j5bg966yl955nsw0zn1zhxri";
# }) {
import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
