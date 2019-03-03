{ pkgs, ... }:

{
  systemd.services.gsconnect = {
    description = "GSConnect Daemon";
    serviceConfig = {
      #  http://www.man7.org/linux/man-pages/man5/systemd.service.5.html
      # sudo systemctl daemon-reload
      # sudo systemctl start gsconnect.service
      # systemctl status gsconnect
      # journalctl -u gsconnect
      Type = "simple";
      ExecStart = "${pkgs.gnome3.gjs}/bin/gjs /home/tycho/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js";
      ExecStop = "${pkgs.procps}/bin/pkill gjs";
      Restart = "on-failure";
      User="tycho";
    };
    wantedBy = [ "multi-user.target" ];
  };

  systemd.services.gsconnect.enable = true;
}
