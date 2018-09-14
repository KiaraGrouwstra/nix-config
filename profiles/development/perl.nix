let
  master = import ../../master.nix;
  latexml = import ./perl/latexml.nix { fetchurl = master.fetchurl; perlPackages = master.perlPackages; };
in
{
  environment.systemPackages = [
    latexml
  ];
}
