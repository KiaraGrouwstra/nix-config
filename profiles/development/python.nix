{ pkgs, ... }:

let
  master = import ../../master.nix;
  my-python-packages = python-packages: with python-packages; [
    pandas
    requests
    tensorflow
    tensorflow-tensorboard
  ];
  python-with-my-packages = master.python3.withPackages my-python-packages;
in
{
  environment.systemPackages = with master; [
    pypi2nix
    python
    conda  # no conda executable exposed?
  ];
}
