{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go
    dotnet-sdk
    scala
  ];
}
