source $stdenv/setup

function unpackPhase {
  tar -xvf $src
  cd nvidia-docker
}

function installPhase {
  mkdir -p $out/bin
  mv * $out/bin
}

function fixupPhase {
  for binary in $out/bin/*; do
    patchelf --set-interpreter $(ldconfig -v 2> /dev/null | head -1 | sed 's/.$//')/ld-linux-x86-64.so.2 $binary
    patchelf --set-rpath $(ldconfig -v 2> /dev/null | head -1 | sed 's/.$//') $binary
  done
}

unpackPhase
installPhase
fixupPhase
