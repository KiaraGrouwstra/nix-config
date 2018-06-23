{ pkgs, ... }:

let
  my-python-packages = python-packages: with python-packages; [
    pandas
    requests
    tensorflow
    tensorflow-tensorboard
  ]; 
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in
{
  environment.systemPackages = with pkgs; [
    conda
  ];
}
