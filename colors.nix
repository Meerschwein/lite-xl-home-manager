{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.lite-xl;
  lite-xl-colors-src = builtins.fetchGit {
    url = "https://github.com/lite-xl/lite-xl-colors";
    rev = "000e6aa9f8068e436db54c7b9ab6a6f7ff2c0ecf";
  };
in {
  options.programs.lite-xl.colors = {
    abyss = mkEnableOption "abyss";
    betelgeuse = mkEnableOption "betelgeuse";
    c0mfy = mkEnableOption "c0mfy";
    cold_lime = mkEnableOption "cold_lime";
    dracula = mkEnableOption "dracula";
    duorand = mkEnableOption "duorand";
    duotone = mkEnableOption "duotone";
    everforest = mkEnableOption "everforest";
    github-dark-dimmed = mkEnableOption "github-dark-dimmed";
    github = mkEnableOption "github";
    github_dark = mkEnableOption "github_dark";
    gruvbox_dark = mkEnableOption "gruvbox_dark";
    gruvbox_light = mkEnableOption "gruvbox_light";
    jb-fleet = mkEnableOption "jb-fleet";
    jellybeans = mkEnableOption "jellybeans";
    liqube = mkEnableOption "liqube";
    mariana = mkEnableOption "mariana";
    moe = mkEnableOption "moe";
    monodark = mkEnableOption "monodark";
    monokai-pro-classic = mkEnableOption "monokai-pro-classic";
    monokai = mkEnableOption "monokai";
    nord = mkEnableOption "nord";
    onedark = mkEnableOption "onedark";
    only_dark = mkEnableOption "only_dark";
    plasma = mkEnableOption "plasma";
    rose-pine-dawn = mkEnableOption "rose-pine-dawn";
    rose-pine-moon = mkEnableOption "rose-pine-moon";
    rose-pine = mkEnableOption "rose-pine";
    solarized_light = mkEnableOption "solarized_light";
    solarobj = mkEnableOption "solarobj";
    synthwave = mkEnableOption "synthwave";
    tokyo-night = mkEnableOption "tokyo-night";
    vscode-dark = mkEnableOption "vscode-dark";
    winter = mkEnableOption "winter";
    zenburn = mkEnableOption "zenburn";
  };
  config = mkIf cfg.enable (mkMerge [
    (mkIf cfg.colors.abyss {
      home.file.".config/lite-xl/colors/abyss.lua".source = "${lite-xl-colors-src}/colors/abyss.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.abyss")'';
    })
    (mkIf cfg.colors.betelgeuse {
      home.file.".config/lite-xl/colors/betelgeuse.lua".source = "${lite-xl-colors-src}/colors/betelgeuse.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.betelgeuse")'';
    })
    (mkIf cfg.colors.c0mfy {
      home.file.".config/lite-xl/colors/c0mfy.lua".source = "${lite-xl-colors-src}/colors/c0mfy.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.c0mfy")'';
    })
    (mkIf cfg.colors.cold_lime {
      home.file.".config/lite-xl/colors/cold_lime.lua".source = "${lite-xl-colors-src}/colors/cold_lime.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.cold_lime")'';
    })
    (mkIf cfg.colors.dracula {
      home.file.".config/lite-xl/colors/dracula.lua".source = "${lite-xl-colors-src}/colors/dracula.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.dracula")'';
    })
    (mkIf cfg.colors.duorand {
      home.file.".config/lite-xl/colors/duorand.lua".source = "${lite-xl-colors-src}/colors/duorand.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.duorand")'';
    })
    (mkIf cfg.colors.duotone {
      home.file.".config/lite-xl/colors/duotone.lua".source = "${lite-xl-colors-src}/colors/duotone.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.duotone")'';
    })
    (mkIf cfg.colors.everforest {
      home.file.".config/lite-xl/colors/everforest.lua".source = "${lite-xl-colors-src}/colors/everforest.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.everforest")'';
    })
    (mkIf cfg.colors.github-dark-dimmed {
      home.file.".config/lite-xl/colors/github-dark-dimmed.lua".source = "${lite-xl-colors-src}/colors/github-dark-dimmed.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.github-dark-dimmed")'';
    })
    (mkIf cfg.colors.github {
      home.file.".config/lite-xl/colors/github.lua".source = "${lite-xl-colors-src}/colors/github.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.github")'';
    })
    (mkIf cfg.colors.github_dark {
      home.file.".config/lite-xl/colors/github_dark.lua".source = "${lite-xl-colors-src}/colors/github_dark.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.github_dark")'';
    })
    (mkIf cfg.colors.gruvbox_dark {
      home.file.".config/lite-xl/colors/gruvbox_dark.lua".source = "${lite-xl-colors-src}/colors/gruvbox_dark.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.gruvbox_dark")'';
    })
    (mkIf cfg.colors.gruvbox_light {
      home.file.".config/lite-xl/colors/gruvbox_light.lua".source = "${lite-xl-colors-src}/colors/gruvbox_light.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.gruvbox_light")'';
    })
    (mkIf cfg.colors.jb-fleet {
      home.file.".config/lite-xl/colors/jb-fleet.lua".source = "${lite-xl-colors-src}/colors/jb-fleet.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.jb-fleet")'';
    })
    (mkIf cfg.colors.jellybeans {
      home.file.".config/lite-xl/colors/jellybeans.lua".source = "${lite-xl-colors-src}/colors/jellybeans.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.jellybeans")'';
    })
    (mkIf cfg.colors.liqube {
      home.file.".config/lite-xl/colors/liqube.lua".source = "${lite-xl-colors-src}/colors/liqube.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.liqube")'';
    })
    (mkIf cfg.colors.mariana {
      home.file.".config/lite-xl/colors/mariana.lua".source = "${lite-xl-colors-src}/colors/mariana.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.mariana")'';
    })
    (mkIf cfg.colors.moe {
      home.file.".config/lite-xl/colors/moe.lua".source = "${lite-xl-colors-src}/colors/moe.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.moe")'';
    })
    (mkIf cfg.colors.monodark {
      home.file.".config/lite-xl/colors/monodark.lua".source = "${lite-xl-colors-src}/colors/monodark.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.monodark")'';
    })
    (mkIf cfg.colors.monokai-pro-classic {
      home.file.".config/lite-xl/colors/monokai-pro-classic.lua".source = "${lite-xl-colors-src}/colors/monokai-pro-classic.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.monokai-pro-classic")'';
    })
    (mkIf cfg.colors.monokai {
      home.file.".config/lite-xl/colors/monokai.lua".source = "${lite-xl-colors-src}/colors/monokai.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.monokai")'';
    })
    (mkIf cfg.colors.nord {
      home.file.".config/lite-xl/colors/nord.lua".source = "${lite-xl-colors-src}/colors/nord.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.nord")'';
    })
    (mkIf cfg.colors.onedark {
      home.file.".config/lite-xl/colors/onedark.lua".source = "${lite-xl-colors-src}/colors/onedark.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.onedark")'';
    })
    (mkIf cfg.colors.only_dark {
      home.file.".config/lite-xl/colors/only_dark.lua".source = "${lite-xl-colors-src}/colors/only_dark.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.only_dark")'';
    })
    (mkIf cfg.colors.plasma {
      home.file.".config/lite-xl/colors/plasma.lua".source = "${lite-xl-colors-src}/colors/plasma.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.plasma")'';
    })
    (mkIf cfg.colors.rose-pine-dawn {
      home.file.".config/lite-xl/colors/rose-pine-dawn.lua".source = "${lite-xl-colors-src}/colors/rose-pine-dawn.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.rose-pine-dawn")'';
    })
    (mkIf cfg.colors.rose-pine-moon {
      home.file.".config/lite-xl/colors/rose-pine-moon.lua".source = "${lite-xl-colors-src}/colors/rose-pine-moon.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.rose-pine-moon")'';
    })
    (mkIf cfg.colors.rose-pine {
      home.file.".config/lite-xl/colors/rose-pine.lua".source = "${lite-xl-colors-src}/colors/rose-pine.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.rose-pine")'';
    })
    (mkIf cfg.colors.solarized_light {
      home.file.".config/lite-xl/colors/solarized_light.lua".source = "${lite-xl-colors-src}/colors/solarized_light.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.solarized_light")'';
    })
    (mkIf cfg.colors.solarobj {
      home.file.".config/lite-xl/colors/solarobj.lua".source = "${lite-xl-colors-src}/colors/solarobj.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.solarobj")'';
    })
    (mkIf cfg.colors.synthwave {
      home.file.".config/lite-xl/colors/synthwave.lua".source = "${lite-xl-colors-src}/colors/synthwave.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.synthwave")'';
    })
    (mkIf cfg.colors.tokyo-night {
      home.file.".config/lite-xl/colors/tokyo-night.lua".source = "${lite-xl-colors-src}/colors/tokyo-night.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.tokyo-night")'';
    })
    (mkIf cfg.colors.vscode-dark {
      home.file.".config/lite-xl/colors/vscode-dark.lua".source = "${lite-xl-colors-src}/colors/vscode-dark.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.vscode-dark")'';
    })
    (mkIf cfg.colors.winter {
      home.file.".config/lite-xl/colors/winter.lua".source = "${lite-xl-colors-src}/colors/winter.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.winter")'';
    })
    (mkIf cfg.colors.zenburn {
      home.file.".config/lite-xl/colors/zenburn.lua".source = "${lite-xl-colors-src}/colors/zenburn.lua";
      programs.lite-xl.hm-module-plugin-before = ''local core = require "core"'';
      programs.lite-xl.hm-module-plugin = ''core.reload_module("colors.zenburn")'';
    })
  ]);
}
