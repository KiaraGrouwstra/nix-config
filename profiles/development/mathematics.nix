{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnuplot
    octave
  ];
}
