{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    conda
  ];
}
