{ fetchurl, perlPackages }:

perlPackages.buildPerlPackage rec {
  name = "RecDescent-1.967015";
  src = fetchurl {
    url = "mirror://cpan/authors/id/J/JT/JTBRAUN/${name}.tar.gz";
    sha256 = "1gxabjb41ihyyik3rk4gnvr1vphc8cdqr7an3dr1vlv04w0s6h9x";
  };
  propagatedBuildInputs = [];
  meta = {
    description = "Generate Recursive-Descent Parsers";
  };
}
