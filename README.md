# Home manager module for lite-xl

## Lite-xl build

A derivation of lite-xl that supports a couple of extra options.
To use it use the package outputs or apply the overlay.
It doesn't support Mac since I can't test it.

```nix
# assuming you have the overlay applied
programs.lite-xl.package = pkgs.lite-xl.override {
  # has no effect if jgmdevBranch is false
  useLuajit = true;
  # a branch of lite-xl with some changes https://github.com/jgmdev/lite-xl/releases/tag/v2.1.1
  jgmdevBranch = true;
  # to use the evergreen plugin https://github.com/TorchedSammy/Evergreen.lxl/
  useLtreesitter = true;
};
```

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
