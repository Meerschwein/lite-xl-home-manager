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
