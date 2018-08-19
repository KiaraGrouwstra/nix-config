{ pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # cudatoolkit
    # nix-prefetch-url file://$PWD/cudnn-9.1-linux-x64-v7.tgz
    # cudnn
  ];

  # systemd.services.nvidia-control-devices = {
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11}/bin/nvidia-smi";
  # };

  system.activationScripts =
  {
    # Enable OpenCL
    opencl =
    ''
      cd /etc
      mkdir -p ./OpenCL/vendors
      cd ./OpenCL/vendors
      # echo '${pkgs.linuxPackages.nvidia_x11}' > nvidia.icd
    '';
  };

  # Enable 3D acceleration for 32bit applications (e.g. wine)
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    # extraPackages = with pkgs; [ vaapiIntel ];
  };

}
