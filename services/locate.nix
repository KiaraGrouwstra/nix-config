{ config, pkgs, ... }:

{
  # Locate will update its database everyday at lunch time
  services.locate = {
    enable = true;
    interval = "00 12 * * *";
  };
}
