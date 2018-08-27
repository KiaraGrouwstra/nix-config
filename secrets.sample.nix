{

  extraHosts = ''
    127.0.0.1 self
  '';

  # generate with `mkpasswd -m sha-512`
  hashedPassword = "qwertyuiop";

  networks = {
    mySsid = {
      psk = "myWifiPassword";
    };
  };

}
