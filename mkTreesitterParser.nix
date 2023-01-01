# stolen from https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/tools/parsing/tree-sitter/grammar.nix
{
  name,
  version,
  src,
}: {
  stdenv,
  nodejs,
  tree-sitter,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  inherit name version src;

  nativeBuildInputs = [nodejs tree-sitter];

  CFLAGS = ["-Isrc" "-O2"];
  CXXFLAGS = ["-Isrc" "-O2"];

  stripDebugList = ["parser"];

  # configurePhase = ''
  #   cd src
  # '';

  # When both scanner.{c,cc} exist, we should not link both since they may be the same but in
  # different languages. Just randomly prefer C++ if that happens.
  buildPhase = ''
    runHook preBuild
    if [[ -e src/scanner.cc ]]; then
      $CXX -fPIC -c src/scanner.cc -o scanner.o $CXXFLAGS
    elif [[ -e src/scanner.c ]]; then
      $CC -fPIC -c src/scanner.c -o scanner.o $CFLAGS
    fi
    $CC -fPIC -c src/parser.c -o parser.o $CFLAGS
    $CXX -shared -o parser *.o
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir $out
    mv parser $out/
    if [[ -d queries ]]; then
      cp -r queries $out
    fi
    runHook postInstall
  '';
}
