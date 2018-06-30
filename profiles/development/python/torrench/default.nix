# { stdenv, fetchFromGitHub, buildPythonApplication
{ fetchFromGitHub, buildPythonApplication
, colorama
}:

buildPythonApplication rec {
  pname = "torrench";
  version = "1.0.61";

  src = fetchFromGitHub {
    owner = "kryptxy";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = "1lsg0g9lnpj2nidggm16b7jm4xzhg0dgy81crfzny62hah1zk0pj";
  };

  propagatedBuildInputs = [ colorama ];

  # doCheck = false;

  # meta = with stdenv.lib; {
  meta = {
    homepage = https://github.com/kryptxy/torrench;
    description = "Command-line torrent search program (cross-platform)";
    # license = stdenv.lib.licenses.mit;
    # maintainers = with maintainers; [ ma27 ];
    maintainers = [  ];
  };
}

# { pkgs ? import <nixpkgs> {} }:

# let
#   deps = (with pkgs; [ pkgs.libxml2 pkgs.libxmlxx pkgs.libxmlxx3 pkgs.libxslt makeWrapper ]);

#   inherit (pkgs) makeWrapper;
#   inherit (pkgs.stdenv.lib) fix' extends inNixShell;

#   pythonPackages =
#   import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
#     inherit pkgs;
#     inherit (pkgs) stdenv;
#     python = pkgs.python36;
#     # patching pip so it does not try to remove files when running nix-shell
#     overrides =
#       self: super: {
#         bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
#           patchPhase = old.patchPhase + ''
#             sed -i               -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"                  $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
#           '';
#         });
#       };
#   };

#   withPackages = pkgs':
#     let
#       pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
#       interpreter = pythonPackages.buildPythonPackage {
#         name = "python36-interpreter";
#         buildInputs = deps ++ 
# (builtins.attrValues 
# pkgs);
#         buildCommand = ''
#           mkdir -p $out/bin
#           ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
#           for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
#             if [ -d "$dep/bin" ]; then
#               for prog in "$dep/bin/"*; do
#                 if [ -f $prog ]; then
#                   ln -s $prog $out/bin/`basename $prog`
#                 fi
#               done
#             fi
#           done
#           for prog in "$out/bin/"*; do
#             wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
#           done
#           pushd $out/bin
#           ln -s ${pythonPackages.python.executable} python
#           ln -s ${pythonPackages.python.executable}               python3
#           popd
#         '';
#         passthru.interpreter = pythonPackages.python;
#       };
#     in {
#       __old = pythonPackages;
#       inherit interpreter;
#       mkDerivation = pythonPackages.buildPythonPackage;
#       packages = pkgs;
#       overrideDerivation = drv: f:
#         pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs //                                            { meta = drv.meta; });
#       withPackages = pkgs'':
#         withPackages (pkgs // pkgs'');
#     };

#   python = withPackages {};

# in python.withPackages
#    (fix' (pkgs.lib.fold
#             extends
#          )
#    )
