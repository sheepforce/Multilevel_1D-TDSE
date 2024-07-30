{ stdenv
, lib
, bash
, gfortran
, meson
, ninja
, pkg-config
, openblas
, fftw
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ML-TDSE";
  version = "dev";

  src = lib.cleanSourceWith {
    filter = path: type: !(builtins.elem path [ "nix" ]);
    src = lib.cleanSource ../../../.;
  };

  nativeBuildInputs = [
    bash
    gfortran
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    openblas
    (lib.getLib fftw)
    (lib.getDev fftw)
  ];

  disableHardening = "all";

  meta.mainProgram = "ML-TDSE";
})
