# nix-prefetch-url --unpack URL
let
rev = "b21994d4ac9c2c8d372bf011668401ee31972c0b";
in
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "1grsq8mcpl88v6kz8dp0vsybr0wzfg4pvhamj42dpd3vgr93l2ib";
}) {
# import /home/tycho/Desktop/nixpkgs {
# import <nixpkgs> {
  config.allowUnfree = true;
}
