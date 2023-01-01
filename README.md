# Home manager module for lite-xl

## Colors

The color themes from [lite-xl-colors](https://github.com/lite-xl/lite-xl-colors)
can be installed.

```nix
programs.lite-xl.colors.vscode-dark = true;
```

## Plugins

They have the same name as in the [plugin repo](https://github.com/lite-xl/lite-xl-plugins/).

```nix
programs.lite-xl.plugins = {
  force_syntax = true;
  language_cmake = true;
};
```

## LSP

There are extra options for the lsp plugin which also install the relevant
language servers and enable them via a plugin.

```nix
programs.lite-xl.lsp.bashls = true;
```

## Lintplus

```nix
programs.lite-xl.lintplus.shellcheck = true;
```

## Formatter

```nix
programs.lite-xl.formatter.black = true;
```

## Evergreen

You need to install ltreesitter for it work.

```nix
programs.lite-xl.package = pkgs.lite-xl.overrideAttrs (_:
let
  ltreesitter = luajit.pkgs.buildLuarocksPackage rec {
    pname = "ltreesitter";
    version = "dev";
    src = fetchFromGitHub {
      owner = "euclidianAce";
      repo = "ltreesitter";
      rev = "d25b514840f25ba919884cbf6bd1ca8cd6b37959";
      sha256 = "sha256-rTlPbywEx887pDNCJtIWgBIdYTskvRhJd4P81+8f/Gs=";
    };
    knownRockspec = "${src}/rockspec/ltreesitter-dev-1.rockspec";
    buildInputs = [tree-sitter];
  };
in {
  installPhase = ''
    ninja install
    cp ${ltreesitter}/lib/lua/5.4/ltreesitter.so $out/share/lite-xl
  '';
});
```

Extra options to install supported parsers.

```nix
programs.lite-xl.evergreen.go = true;
```
