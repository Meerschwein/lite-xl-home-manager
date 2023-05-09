{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.lite-xl;

  linterconfigs = mapAttrsToList (name: packages: {inherit name packages;}) {
    luacheck = [pkgs.lua53Packages.luacheck];
    nelua = []; # not yet in stable https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/interpreters/nelua/default.nix
    nim = [pkgs.nim];
    php = [pkgs.php];
    python = [pkgs.python310Packages.flake8];
    rust = with pkgs; [cargo clippy];
    shellcheck = [pkgs.shellcheck];
    v = [pkgs.vlang];
    zig = [pkgs.zig];
  };
in {
  options.programs.lite-xl.lintplus = builtins.listToAttrs (map (c: {
      name = c.name;
      value = mkEnableOption "c.name";
    })
    linterconfigs);

  config = mkIf cfg.enable (mkMerge (map (c: (mkIf cfg.lintplus.${c.name} {
      home.packages = c.packages;
      programs.lite-xl = {
        plugins.lintplus = true;
        hm-module-plugin-before = ''local lintplus = require "plugins.lintplus"'';
        hm-module-plugin = ''lintplus.load("${c.name}")'';
      };
    }))
    linterconfigs));
}
