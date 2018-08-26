{
  systemd.user.services.gsconnect = {
    description = "GSConnect Daemon";
    serviceConfig = {
      #  http://www.man7.org/linux/man-pages/man5/systemd.service.5.html
      Type = "simple";
      ExecStart = "gjs ~/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js";
      ExecStop = "pkill gjs";
      Restart = "on-failure";
    };
    wantedBy = [ "default.target" ];
  };

  systemd.services.gsconnect.enable = true;
}
