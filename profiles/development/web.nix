{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    postman
  ];
}
