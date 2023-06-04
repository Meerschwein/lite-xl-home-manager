{
  agg,
  cmake,
  fetchFromGitHub,
  freetype,
  lib,
  libuchardet,
  meson,
  ninja,
  pcre2,
  pkg-config,
  pkgs,
  reproc,
  SDL2,
  stdenv,
  tree-sitter,
  # has no effect if jgmdevBranch is false
  useLuajit ? false,
  # a branch of lite-xl with some changes https://github.com/jgmdev/lite-xl/releases/tag/v2.1.1
  jgmdevBranch ? false,
  # to use the evergreen plugin https://github.com/TorchedSammy/Evergreen.lxl/
  useLtreesitter ? false,
}: let
  enableLuajit = jgmdevBranch && useLuajit;

  lua =
    if enableLuajit
    then pkgs.luajit
    else pkgs.lua5_4;

  ltreesitter = lua.pkgs.buildLuarocksPackage rec {
    pname = "ltreesitter";
    version = "dev";
    src = fetchFromGitHub {
      owner = "euclidianAce";
      repo = "ltreesitter";
      rev = "2fee1956f42bb09504db2ef8eeec2c3b7da7b0c0";
      sha256 = "sha256-2utF61JJYtdn64EDSOnglRRxBRaTOgu4vgd3LsQY/cE=";
    };
    knownRockspec = "${src}/rockspec/ltreesitter-dev-1.rockspec";
    buildInputs = [tree-sitter];
  };
in
  stdenv.mkDerivation rec {
    name = "lite-xl";
    version = "2.1.1";

    src = fetchFromGitHub {
      repo = "lite-xl";
      rev = "v${version}";
      owner =
        if jgmdevBranch
        then "jgmdev"
        else "lite-xl";
      sha256 =
        if jgmdevBranch
        then "sha256-5VwQPIK8IgPM+aMyLFy0KWYaZg5Oc7TTiEE8phCFUD8="
        else "sha256-tZ9bCazs4ygNl5RKFNUtxboaMcG8a7mIz2FuiExX1d4=";
    };

    mesonFlags = lib.optionals enableLuajit ["-Djit=true"];

    installPhase = lib.optionals useLtreesitter ''
      ninja install
      cp ${ltreesitter}/lib/lua/${lua.luaversion}/ltreesitter.so $out/share/lite-xl
    '';

    nativeBuildInputs = [meson ninja pkg-config];

    buildInputs = [
      agg
      cmake
      freetype
      libuchardet
      lua
      pcre2
      reproc
      SDL2
    ];
  }
