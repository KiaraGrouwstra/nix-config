{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    ctags
    cabal2nix
    cabal-install
    stack

    ghc
    # haskell.compiler.ghc822
    # haskell.compiler.ghc-8.4.2
    # ghc-8.4.3
    # ghc-8.5
  ] ++ (with master.haskellPackages; [

    # # libraries
    # alex
    # happy
    # hakyll

    # tools
    #hscope
    #argon          # code complexity (req: haskell 7.10)
    # codex           # ctags file generator for cabal project dependencies
    # ghc-mod         # ghc-mod is a backend program to enrich editors
    ghcid           # GHCi as a daemon
    # hasktags        # Produces ctags "tags" and etags "TAGS" files for Haskell programs 
    hlint           # linter
    hoogle          # type signature search
    hpack           # yaml based package format
    hspec           # testing framework
    intero          # IDE tooltips
    # pointfree       # http://pointfree.io/
    # pointful        # https://github.com/23Skidoo/pointful
    stylish-haskell # pretty printer
    tasty           # testing framework
    weeder          # dead code detection

    typedflow
  ]);
}
