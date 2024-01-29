{
  fetchFromGitHub,
  freetype,
  lua5_4,
  meson,
  ninja,
  pcre2,
  pkg-config,
  SDL2,
  stdenv,
}:
stdenv.mkDerivation rec {
  name = "lite-xl";
  version = "2.1.3";

  src = fetchFromGitHub {
    repo = "lite-xl";
    rev = "v${version}";
    owner = "lite-xl";
    sha256 = "sha256-4ykUdcNwJ4r/4u9H+c8pgupY3BaPi2y69X6yaDjCjac=";
  };

  mesonFlags = [
    "-Duse_system_lua=true"
    "--buildtype=release"
  ];

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    freetype
    lua5_4
    pcre2
    SDL2
  ];
}
