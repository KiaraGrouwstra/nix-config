{ pkgs, ... }:

let
  master = import ../../master.nix;
  torrench = import ./python/torrench/default.nix;
  my-python-packages = python-packages: with python-packages; [
    pip
    setuptools
    pandas
    requests
    # pkgs.python36Packages.flask
    tensorflow
    # tensorflow-tensorboard
    # tensorflowWithoutCuda
    # nix-store --add-fixed sha256 /drogon/dl/cuda/cudnn-9.1-linux-x64-v7.1.tgz
    # tensorflowWithCuda

    # build:
    # pypi2nix -V 3.6
    # nix-shell requirements.nix -A interpreter

    # try from nix package:
    # nix-shell -p pythonPackages.pip

  ];
  python-with-my-packages = master.python3.withPackages my-python-packages;
in
{
  environment.systemPackages = with master; [
    pypi2nix
    # python
    # python3
    python-with-my-packages
    conda  # no conda executable exposed?
  ];
}
