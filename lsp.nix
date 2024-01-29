{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.lite-xl;

  lspconfigs = mapAttrsToList (name: packages: {inherit name packages;}) {
    bashls = [pkgs.nodePackages.bash-language-server];
    ccls = [pkgs.ccls];
    clangd = [pkgs.clang_13];
    clojure_lsp = [pkgs.clojure-lsp];
    cssls = [pkgs.nodePackages.vscode-css-languageserver-bin];
    dartls = [pkgs.dart];
    deno = [pkgs.deno];
    dockerls = [pkgs.nodePackages.dockerfile-language-server-nodejs];
    fennells = []; # Not found in nixpkgs
    flow = [pkgs.flow];
    gopls = [pkgs.gopls];
    groovyls = []; # Not found in nixpkgs
    hls = [pkgs.haskell-language-server];
    html = [pkgs.nodePackages.vscode-html-languageserver-bin];
    intelephense = [pkgs.nodePackages.intelephense];
    jsonls = [pkgs.nodePackages.vscode-json-languageserver];
    kotlin_language_server = [pkgs.kotlin-language-server];
    lemminx = [pkgs.lemminx];
    nillsp = [pkgs.nil];
    nimlsp = [pkgs.nimlsp];
    ocaml_lsp = [pkgs.ocamlPackages.ocaml-lsp];
    omnisharp = []; # Not found in nixpkgs
    perlnavigator = [pkgs.perlnavigator];
    pyls = []; # Not found in nixpkgs
    pylsp = [python311Packages.python-lsp-server];
    pyright = [pkgs.nodePackages.pyright];
    rlanguageserver = []; # pkgs.R doesn't work
    rls = [pkgs.rls];
    ruby_lsp = [pkgs.ruby-lsp];
    rust_analyzer = [pkgs.rust-analyzer];
    solargraph = [pkgs.rubyPackages.solargraph];
    sqlls = []; # Not found in nixpkgs
    sumneko_lua = [pkgs.sumneko-lua-language-server];
    sveltels = [pkgs.nodePackages.svelte-language-server];
    texlab = [pkgs.texlab];
    tsserver = [pkgs.nodePackages.typescript-language-server];
    vimls = [pkgs.nodePackages.vim-language-server];
    vls = []; # Not found in nixpkgs
    yamlls = [pkgs.nodePackages.yaml-language-server];
    zls = [pkgs.zls];
  };
in {
  options.programs.lite-xl.lsp = builtins.listToAttrs (map (c: {
      name = c.name;
      value = mkEnableOption "${c.name}";
    })
    lspconfigs);

  config = mkIf cfg.enable (mkMerge (map (c: (mkIf cfg.lsp.${c.name} {
      home.packages = c.packages;
      programs.lite-xl = {
        plugins.lsp = true;
        hm-module-plugin-before = ''local lspconfig = require "plugins.lsp.config"'';
        hm-module-plugin = "lspconfig.${c.name}.setup()";
      };
    }))
    lspconfigs));
}
