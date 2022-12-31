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

Extra options to install supported parsers.

```nix
programs.lite-xl.evergreen.go = true;
```
