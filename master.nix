# nix-prefetch-url --unpack URL
let
  rev = "aac3ae3be619c0622e6df4ed6b58231ec4abfe4f";
in
fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  sha256 = "01adrv17m6255v2pwi871kykjdk5pmjqqaia2rl88mskvgi38sgz";
}

