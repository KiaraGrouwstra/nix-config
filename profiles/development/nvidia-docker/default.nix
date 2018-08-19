# with import <nixpkgs> {
#   nixpkgs.config.allowUnfree = true;
# };

# with pkgs;
with import ../../../master.nix;
stdenv.mkDerivation {
  name = "nvidia-docker-1.0.1";

  src = fetchurl {
    url = "https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1_amd64.tar.xz";
    sha256 = "0dz26is7wssph1s87221z8d8plj47lzr4hnw0spvrj2rsw70kvms";
    # url = "https://github.com/NVIDIA/nvidia-docker/archive/v1.0.1.tar.gz";
    # sha256 = "1kcawdcb49ri5rvzj6j2qa7yp3xfdi8j0wrgxb1kanfwz9bz0z5v";
  };

  buildInputs = [ cudatoolkit docker ];

  builder = ./bin_builder.sh;

  meta = {
    description = "Docker Engine Utility for NVIDIA GPUs";
    homepage = https://github.com/NVIDIA/nvidia-docker;
    license = "BSD-3-Clause";
  };
}
