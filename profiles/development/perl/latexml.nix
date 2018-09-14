{ fetchurl, perlPackages }:

let
  RecDescent = import ./perl/RecDescent.nix { fetchurl = fetchurl; perlPackages = perlPackages; };
in

perlPackages.buildPerlPackage rec {
  name = "LaTeXML-0.8.2";
  src = fetchurl {
    url = "mirror://cpan/authors/id/B/BR/BRMILLER/${name}.tar.gz";
    sha256 = "1gxabjb41ihyyik3rk4gnvr1vphc8cdqr7an3dr1vlv04w0s6h9x";
  };
  propagatedBuildInputs = [];
  meta = {
    description = "transforms a TeX/LaTeX file into XML";
  };
}
