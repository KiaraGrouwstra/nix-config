# # nix-prefetch-url --unpack REV
# rev = "8e78a9a68fea58147541444e9cd57d7043be3ee7";
# pkgs = import (fetchTarball {
#   url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
#   sha256 = "1fhfwbn16rvlzxp2y7118j646pzzfj974qcnqh3qwppkyqp1g5q6";
# }) {
import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
