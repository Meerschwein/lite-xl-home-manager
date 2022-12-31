# Home manager module for lite-xl

## Evergreen

You need to install ltreesitter for it work.

```nix
programs.lite-xl.package = pkgs.lite-xl.overrideAttrs (_:
let
  ltreesitter-src = pkgs.fetchFromGitHub {
    owner = "euclidianAce";
    repo = "ltreesitter";
    rev = "21e9a468af00a54faf76ed72b963e8281fddfadb";
    sha256 = "sha256-Gorw2Rr8QhOsLU7zNwCXzthqxQdvcmXn7vou9hbaw8k=";
  };
  ltreesitter = pkgs.lua5_4.pkgs.buildLuarocksPackage {
    pname = "ltreesitter";
    version = "dev";
    src = ltreesitter-src;
    knownRockspec = "${ltreesitter-src}/rockspec/ltreesitter-dev-1.rockspec";
    buildInputs = [pkgs.tree-sitter];
  };
in {
  installPhase = ''
    ninja install
    cp ${ltreesitter}/lib/lua/5.4/ltreesitter.so $out/share/lite-xl
  '';
});
```
