{ config, lib, pkgs, ... }:

{
  imports = [
    ./haskell.nix
    ./python.nix
    ./java.nix
    ./ruby.nix
    ./web.nix
    ./servers.nix
    ./compilers.nix
    ./latex.nix
    ./mathematics.nix
  ];

  # install development packages
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    binutils-unwrapped
    zlib
    protobuf
    snappy
    nix-generate-from-cpan
    libtool
    unzip
    autoconf
    automake
    autogen
    gnum4
    openssl
    c-ares
    curl
    libraw
    sqlite
    graphviz
    dhall
  ];

  # custom packages
  nixpkgs.config.packageOverrides = pkgs: rec {

    myNeoVimPlugins = pkgs.neovim.override {
      configure = {
#        customRC = ''
#          # custom configuration
#        '';
        plug.plugins = with pkgs.vimPlugins; [
          vim-pathogen
          vim-go
          syntastic
          nerdtree
          ctrlp.vim
          vim-airline
          youcompleteme
          vim-fugitive
          nerdtree
#          ghcmod-vim
        ];
      };
    };

    myVimPlugins = pkgs.vim_configurable.customize {
      name = "vim-with-plugins";
      vimrcConfig.vam.knownPlugins = pkgs.vimPlugins; # optional
      vimrcConfig.vam.pluginDictionaries = [
        # load always
        {
          names = [
            "fatih/vim-go"
            "scrooloose/syntastic"
            "scrooloose/nerdtree"
            "ctrlpvim/ctrlp.vim"
            "vim-airline/vim-airline"
            "valloric/youcompleteme"
            "tpope/vim-fugitive"
          ];
        }

        # only load when opening a .hs file
        { name = "eagletmt/ghcmod-vim"; ft_regex = "^hs\$"; }
        # { name = "eagletmt/ghcmod-vim"; filename_regex = "^.hs\$"; }

        # provide plugin which can be loaded manually:
        # { name = "scrooloose/syntastic"; tag = "lazy"; }
      ];
    };

  };

}
