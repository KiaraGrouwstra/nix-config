# nix-prefetch-url --unpack REV
let
rev = "e5b02664aa1fcf0b6efacd75d8d812a82feee0ed";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "1fhfwbn16rvlzxp2y7118j646pzzfj974qcnqh3qwppkyqp1g5q6";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
