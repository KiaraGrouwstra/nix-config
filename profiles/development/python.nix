{ pkgs, ... }:

let
  master = import ../../master.nix;
  torrench = import ./python/torrench/default.nix;
  my-python-packages = python-packages: with python-packages; [
    # python36Packages.pip  #  exe?
    python36Packages.setuptools
    pandas
    requests
    tensorflow
    tensorflow-tensorboard
    torrench  # missing

    # build:
    # pypi2nix -V 3.6
    # nix-shell requirements.nix -A interpreter

    # try w/ docker:
    # docker run -it python bash
    # curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    # python get-pip.py
    # pip install torrench
    # mkdir -p ~/.config/torrench
    # wget -O ~/.config/torrench/config.ini https://pastebin.com/raw/reymRHSL
    # sed -i 's/= 0/= 1/g' ~/.config/torrench/config.ini
    # torrench --interactive
    # torrench -n nya

  ];
  python-with-my-packages = master.python3.withPackages my-python-packages;
in
{
  environment.systemPackages = with master; [
    pypi2nix
    python
    python3
    conda  # no conda executable exposed?
  ];
}
