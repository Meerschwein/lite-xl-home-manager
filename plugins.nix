{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.lite-xl;
  gitblame-src = builtins.fetchGit {
    url = "https://github.com/juliardi/lite-xl-gitblame";
    rev = "6de7a97bb2b635ac667750f49087afd9980f2e06";
  };
  linter-src = builtins.fetchGit {
    url = "https://github.com/drmargarido/linters";
    rev = "eb1611eaade6e5328df5172bd3f759d853c33a31";
  };
  lorem-src = builtins.fetchGit {
    url = "https://github.com/sheetcoder/lorem";
    rev = "b2da386519850d6f91ef67097e50141b3b11a90e";
  };
  lspkind-src = builtins.fetchGit {
    url = "https://github.com/TorchedSammy/lite-xl-lspkind";
    rev = "272ebd0010cd3e205cfb486b1bae889080fec437";
  };
  net-src = builtins.fetchGit {
    url = "https://github.com/jgmdev/lite-xl-net";
    rev = "4ddece50cdc6d00ab09be1896ef0474e89da89b8";
  };
  console-src = builtins.fetchGit {
    url = "https://github.com/franko/console";
    rev = "08c3f5e1483627c3ae688ce5a99008e823357f2c";
  };
  encodings-src = builtins.fetchGit {
    url = "https://github.com/jgmdev/lite-xl-encoding";
    rev = "16e2477e916f52e18f6d63f5ac61ace58b0c5e45";
  };
  exterm-src = builtins.fetchGit {
    url = "https://github.com/ShadiestGoat/lite-xl-exterm";
    rev = "aca8827fc1af831890cffd3dd122debac72429c6";
  };
  scm-src = builtins.fetchGit {
    url = "https://github.com/lite-xl/lite-xl-scm";
    rev = "930951990f9a3c78178265e5380e3c9e40b109d2";
  };
  widget-src = builtins.fetchGit {
    url = "https://github.com/lite-xl/lite-xl-widgets";
    rev = "b5e6e212c0516ec7b55f57c7efcfda9d791cdb0d";
  };
  encoding-src = builtins.fetchGit {
    url = "https://github.com/jgmdev/lite-xl-encoding";
    rev = "16e2477e916f52e18f6d63f5ac61ace58b0c5e45";
  };
  fallbackfonts-src = builtins.fetchGit {
    url = "https://github.com/takase1121/lite-fallback-fonts";
    rev = "281cafc014f7931f041046f76496797695678bb4";
  };
  lsp_snippets-src = builtins.fetchGit {
    url = "https://github.com/vqns/lite-xl-snippets";
    rev = "37a24d0970668e39ef571e607281e61135f7a504";
  };
  litepresence-src = builtins.fetchGit {
    url = "https://github.com/TorchedSammy/Litepresence";
    rev = "1985e8a59feaaea5085a5add2521293a11f6d376";
  };
  lsp_lua-src = builtins.fetchGit {
    url = "https://github.com/adamharrison/lite-xl-lsp-servers";
    rev = "d8f85c5fb09d2a97594fead7cf495510e22502a9";
  };
  snippets-src = builtins.fetchGit {
    url = "https://github.com/vqns/lite-xl-snippets";
    rev = "37a24d0970668e39ef571e607281e61135f7a504";
  };
  endwise-src = builtins.fetchGit {
    url = "https://github.com/LolsonX/endwise-lite-xl.git";
    rev = "d9ced6089ab7f54bad197c30ba581055270f2dad";
  };
  gitdiff_highlight-src = builtins.fetchGit {
    url = "https://github.com/vincens2005/lite-xl-gitdiff-highlight";
    rev = "12ddfa619054dfdd1ed86426d60b569dc536c43e";
  };
  immersive-title-src = builtins.fetchGit {
    url = "https://github.com/takase1121/lite-xl-immersive-title";
    rev = "cf3a8029ac7154ea53ac819a95d44a6ff102f051";
  };
  plugin_manager-src = builtins.fetchGit {
    url = "https://github.com/lite-xl/lite-xl-plugin-manager.git";
    rev = "3e5d5b0827058f2eeddfb166d8128fc086a87e28";
  };
  formatter-src = builtins.fetchGit {
    url = "https://github.com/vincens2005/lite-formatters";
    rev = "7e017080a967c01d437e484247a90c1ff52e8ef8";
  };
  language_containerfile-src = builtins.fetchGit {
    url = "https://github.com/FilBot3/lite-xl-language-containerfile";
    rev = "2d5e46b1051c48d74f9b63f9844913c630d19b87";
  };
  language_ignore-src = builtins.fetchGit {
    url = "https://github.com/anthonyaxenov/lite-xl-ignore-syntax";
    rev = "3a9a5e0ae03b82358473da5d1c6012944d65ea95";
  };
  theme16-src = builtins.fetchGit {
    url = "https://github.com/monolifed/theme16";
    rev = "c39b33cb318d4baa2b4b9cc6e6370cb3ede3ef22";
  };
  updatechecker-src = builtins.fetchGit {
    url = "https://github.com/vincens2005/lite-xl-updatechecker";
    rev = "3478abd43618da857d4315bcc8fddf08c27e1150";
  };
  discord-presence-src = builtins.fetchGit {
    url = "https://github.com/vincens2005/lite-xl-discord";
    rev = "93ac3abb7381fe6d5c9734e40c008cd26713f1a8";
  };
  kinc-projects-src = builtins.fetchGit {
    url = "https://github.com/Kode-Community/kinc_plugin";
    rev = "309fe4193a09cf739ed0a058b1a6966a463a1dbd";
  };
  lsp-src = builtins.fetchGit {
    url = "https://github.com/lite-xl/lite-xl-lsp";
    rev = "607cc85978b6fe169c2e6cabe779776d752267f8";
  };
  todotreeview-src = builtins.fetchGit {
    url = "https://github.com/drmargarido/TodoTreeView";
    rev = "a9371045ead3bc820224d3be55db6066398a11c5";
  };
  treeview-menu-extender-src = builtins.fetchGit {
    url = "https://github.com/juliardi/lite-xl-treeview-menu-extender";
    rev = "bd9063e453b4024dcd0bf6a4f775ded32ca24d1f";
  };
  vibe-src = builtins.fetchGit {
    url = "https://github.com/eugenpt/lite-xl-vibe";
    rev = "651c4fc55a285eeacbf5992b355d9c80f4fc78cb";
  };
  language_pony-src = builtins.fetchGit {
    url = "https://github.com/MrAnyx/lite-plugin-pony";
    rev = "34d9ec673eaa6c409bcef0febaa0a36cc3acdf4e";
  };
  lintplus-src = builtins.fetchGit {
    url = "https://github.com/liquid600pgm/lintplus";
    rev = "771b1fe6cddb7897cd034ed5ee96201d6a2831c2";
  };
  lsp_c-src = builtins.fetchGit {
    url = "https://github.com/adamharrison/lite-xl-lsp-servers";
    rev = "d8f85c5fb09d2a97594fead7cf495510e22502a9";
  };
  projectsearch-src = builtins.fetchGit {
    url = "https://github.com/jgmdev/lite-xl-threads";
    rev = "9299a9a6b778cb34b12f0286b9162779920a9197";
  };
  thread-src = builtins.fetchGit {
    url = "https://github.com/jgmdev/lite-xl-threads";
    rev = "9299a9a6b778cb34b12f0286b9162779920a9197";
  };
  build-src = builtins.fetchGit {
    url = "https://github.com/adamharrison/lite-xl-ide.git";
    rev = "c254d8cbc1932fd69e4c135f1d53c4e81a9f293a";
  };
  equationgrapher-src = builtins.fetchGit {
    url = "https://github.com/ThaCuber/equationgrapher";
    rev = "bd7056b5d4a6f6b98365e1a5e3e78e29ed843d13";
  };
  findfileimproved-src = builtins.fetchGit {
    url = "https://github.com/jgmdev/lite-xl-threads";
    rev = "9299a9a6b778cb34b12f0286b9162779920a9197";
  };
  www-src = builtins.fetchGit {
    url = "https://github.com/adamharrison/lite-xl-www.git";
    rev = "aecc866c33b0a954fbd41a5de2842bb97f4ac45e";
  };
  evergreen-src = builtins.fetchGit {
    url = "https://github.com/TorchedSammy/Evergreen.lxl";
    rev = "c4058bfdedd27aee3b23319905b5df7b4ca52ef8";
  };
  language_crystal-src = builtins.fetchGit {
    url = "https://github.com/Tamnac/lite-plugin-crystal";
    rev = "1913a6dd23a7640b507943230291a15aecc3235d";
  };
  language_env-src = builtins.fetchGit {
    url = "https://github.com/anthonyaxenov/lite-xl-env-syntax";
    rev = "89a4274af6a786963930d7a8fb542dfe61daa801";
  };
  visu-src = builtins.fetchGit {
    url = "https://github.com/TorchedSammy/Visu";
    rev = "782c7b1ebde38dad2c3c6a1c1dee6761230dea16";
  };
  lite-xl-plugins-src = builtins.fetchGit {
    url = "https://github.com/Meerschwein/lite-xl-plugins";
    rev = "565587f5706c87c61abdf6adeb64943062ad10f1";
  };
  black-src = builtins.fetchGit {
    url = "https://git.sr.ht/~tmpod/black-lite";
    rev = "2a1ab1b703f954edb39efb73e72b44c0d18b30a2";
  };
  debugger-src = builtins.fetchGit {
    url = "https://github.com/adamharrison/lite-xl-ide.git";
    rev = "c254d8cbc1932fd69e4c135f1d53c4e81a9f293a";
  };
in {
  options.programs.lite-xl.plugins = {
    navigate = mkEnableOption "navigate";
    theme16 = mkEnableOption "theme16";
    autosaveonfocuslost = mkEnableOption "autosaveonfocuslost";
    language_caddyfile = mkEnableOption "language_caddyfile";
    language_psql = mkEnableOption "language_psql";
    lsp_snippets = mkEnableOption "lsp_snippets";
    language_objc = mkEnableOption "language_objc";
    language_tsx = mkEnableOption "language_tsx";
    ide = mkEnableOption "ide";
    colorpreview = mkEnableOption "colorpreview";
    eval = mkEnableOption "eval";
    language_ini = mkEnableOption "language_ini";
    language_tex = mkEnableOption "language_tex";
    memoryusage = mkEnableOption "memoryusage";
    pdfview = mkEnableOption "pdfview";
    themeselect = mkEnableOption "themeselect";
    debugger = mkEnableOption "debugger";
    immersive-title = mkEnableOption "immersive-title";
    language_containerfile = mkEnableOption "language_containerfile";
    language_fe = mkEnableOption "language_fe";
    widget = mkEnableOption "widget";
    endwise = mkEnableOption "endwise";
    language_sh = mkEnableOption "language_sh";
    snippets = mkEnableOption "snippets";
    open_ext = mkEnableOption "open_ext";
    markers = mkEnableOption "markers";
    nonicons = mkEnableOption "nonicons";
    scm = mkEnableOption "scm";
    language_toml = mkEnableOption "language_toml";
    treeview-menu-extender = mkEnableOption "treeview-menu-extender";
    centerdoc = mkEnableOption "centerdoc";
    language_batch = mkEnableOption "language_batch";
    language_ignore = mkEnableOption "language_ignore";
    language_lobster = mkEnableOption "language_lobster";
    gitopen = mkEnableOption "gitopen";
    language_crystal = mkEnableOption "language_crystal";
    language_java = mkEnableOption "language_java";
    language_make = mkEnableOption "language_make";
    autowrap = mkEnableOption "autowrap";
    lite-debugger = mkEnableOption "lite-debugger";
    projectsearch = mkEnableOption "projectsearch";
    force_syntax = mkEnableOption "force_syntax";
    selectionhighlight = mkEnableOption "selectionhighlight";
    language_nix = mkEnableOption "language_nix";
    language_ts = mkEnableOption "language_ts";
    language_yaml = mkEnableOption "language_yaml";
    lsp = mkEnableOption "lsp";
    spellcheck = mkEnableOption "spellcheck";
    togglesnakecamel = mkEnableOption "togglesnakecamel";
    vibe = mkEnableOption "vibe";
    kinc-projects = mkEnableOption "kinc-projects";
    language_gdscript = mkEnableOption "language_gdscript";
    language_go = mkEnableOption "language_go";
    language_teal = mkEnableOption "language_teal";
    litepresence = mkEnableOption "litepresence";
    openselected = mkEnableOption "openselected";
    align_carets = mkEnableOption "align_carets";
    language_d = mkEnableOption "language_d";
    language_jsx = mkEnableOption "language_jsx";
    linter = mkEnableOption "linter";
    language_tal = mkEnableOption "language_tal";
    sort = mkEnableOption "sort";
    wordcount = mkEnableOption "wordcount";
    build = mkEnableOption "build";
    findfileimproved = mkEnableOption "findfileimproved";
    language_diff = mkEnableOption "language_diff";
    language_odin = mkEnableOption "language_odin";
    language_zig = mkEnableOption "language_zig";
    nerdicons = mkEnableOption "nerdicons";
    search_ui = mkEnableOption "search_ui";
    fallbackfonts = mkEnableOption "fallbackfonts";
    language_glsl = mkEnableOption "language_glsl";
    language_miniscript = mkEnableOption "language_miniscript";
    language_nginx = mkEnableOption "language_nginx";
    lfautoinsert = mkEnableOption "lfautoinsert";
    minimap = mkEnableOption "minimap";
    texcompile = mkEnableOption "texcompile";
    ephemeral_tabs = mkEnableOption "ephemeral_tabs";
    gitdiff_highlight = mkEnableOption "gitdiff_highlight";
    language_hs = mkEnableOption "language_hs";
    language_powershell = mkEnableOption "language_powershell";
    motiontrail = mkEnableOption "motiontrail";
    autosave = mkEnableOption "autosave";
    datetimestamps = mkEnableOption "datetimestamps";
    fontconfig = mkEnableOption "fontconfig";
    language_moon = mkEnableOption "language_moon";
    macmodkeys = mkEnableOption "macmodkeys";
    regexreplacepreview = mkEnableOption "regexreplacepreview";
    svg_screenshot = mkEnableOption "svg_screenshot";
    eofnewline = mkEnableOption "eofnewline";
    language_pony = mkEnableOption "language_pony";
    language_tcl = mkEnableOption "language_tcl";
    language_v = mkEnableOption "language_v";
    primary_selection = mkEnableOption "primary_selection";
    ghmarkdown = mkEnableOption "ghmarkdown";
    language_elm = mkEnableOption "language_elm";
    language_fstab = mkEnableOption "language_fstab";
    language_rescript = mkEnableOption "language_rescript";
    gitstatus = mkEnableOption "gitstatus";
    language_erb = mkEnableOption "language_erb";
    language_haxe = mkEnableOption "language_haxe";
    language_r = mkEnableOption "language_r";
    keymap_export = mkEnableOption "keymap_export";
    lintplus = mkEnableOption "lintplus";
    tab_switcher = mkEnableOption "tab_switcher";
    language_pkgbuild = mkEnableOption "language_pkgbuild";
    language_rust = mkEnableOption "language_rust";
    restoretabs = mkEnableOption "restoretabs";
    sticky_scroll = mkEnableOption "sticky_scroll";
    bigclock = mkEnableOption "bigclock";
    console = mkEnableOption "console";
    language_elixir = mkEnableOption "language_elixir";
    language_jiyu = mkEnableOption "language_jiyu";
    typingspeed = mkEnableOption "typingspeed";
    dragdropselected = mkEnableOption "dragdropselected";
    encodings = mkEnableOption "encodings";
    language_angelscript = mkEnableOption "language_angelscript";
    language_scala = mkEnableOption "language_scala";
    language_nim = mkEnableOption "language_nim";
    lspkind = mkEnableOption "lspkind";
    updatechecker = mkEnableOption "updatechecker";
    colorpicker = mkEnableOption "colorpicker";
    exec = mkEnableOption "exec";
    language_bib = mkEnableOption "language_bib";
    language_gmi = mkEnableOption "language_gmi";
    indent_convert = mkEnableOption "indent_convert";
    language_ksy = mkEnableOption "language_ksy";
    language_liquid = mkEnableOption "language_liquid";
    language_perl = mkEnableOption "language_perl";
    lorem = mkEnableOption "lorem";
    editorconfig = mkEnableOption "editorconfig";
    evergreen = mkEnableOption "evergreen";
    language_assembly_x86 = mkEnableOption "language_assembly_x86";
    language_assembly_riscv = mkEnableOption "language_assembly_riscv";
    gitblame = mkEnableOption "gitblame";
    language_autohotkey_v1 = mkEnableOption "language_autohotkey_v1";
    language_blade = mkEnableOption "language_blade";
    equationgrapher = mkEnableOption "equationgrapher";
    extend_selection_line = mkEnableOption "extend_selection_line";
    unboundedscroll = mkEnableOption "unboundedscroll";
    select_colorscheme = mkEnableOption "select_colorscheme";
    statusclock = mkEnableOption "statusclock";
    language_fennel = mkEnableOption "language_fennel";
    language_julia = mkEnableOption "language_julia";
    linenumbers = mkEnableOption "linenumbers";
    rainbowparen = mkEnableOption "rainbowparen";
    language_meson = mkEnableOption "language_meson";
    language_wren = mkEnableOption "language_wren";
    smoothcaret = mkEnableOption "smoothcaret";
    tabnumbers = mkEnableOption "tabnumbers";
    profiler = mkEnableOption "profiler";
    autoinsert = mkEnableOption "autoinsert";
    copyfilelocation = mkEnableOption "copyfilelocation";
    ipc = mkEnableOption "ipc";
    language_gabc = mkEnableOption "language_gabc";
    gofmt = mkEnableOption "gofmt";
    language_pico8 = mkEnableOption "language_pico8";
    language_po = mkEnableOption "language_po";
    language_ruby = mkEnableOption "language_ruby";
    black = mkEnableOption "black";
    bracketmatch = mkEnableOption "bracketmatch";
    discord-presence = mkEnableOption "discord-presence";
    exterm = mkEnableOption "exterm";
    scalestatus = mkEnableOption "scalestatus";
    settings = mkEnableOption "settings";
    smallclock = mkEnableOption "smallclock";
    todotreeview = mkEnableOption "todotreeview";
    openfilelocation = mkEnableOption "openfilelocation";
    visu = mkEnableOption "visu";
    language_env = mkEnableOption "language_env";
    language_hlsl = mkEnableOption "language_hlsl";
    language_sass = mkEnableOption "language_sass";
    language_ssh_config = mkEnableOption "language_ssh_config";
    custom_caret = mkEnableOption "custom_caret";
    formatter = mkEnableOption "formatter";
    smartopenselected = mkEnableOption "smartopenselected";
    opacity = mkEnableOption "opacity";
    titleize = mkEnableOption "titleize";
    indentguide = mkEnableOption "indentguide";
    language_cmake = mkEnableOption "language_cmake";
    language_lilypond = mkEnableOption "language_lilypond";
    language_php = mkEnableOption "language_php";
    language_csharp = mkEnableOption "language_csharp";
    language_dart = mkEnableOption "language_dart";
    language_htaccess = mkEnableOption "language_htaccess";
    language_rivet = mkEnableOption "language_rivet";
    # dummy dependencies
    lsp_c = mkEnableOption "lsp_c";
    encoding = mkEnableOption "encoding";
    json = mkEnableOption "json";
    thread = mkEnableOption "thread";
  };
  config = mkIf cfg.enable (mkMerge [
    (mkIf cfg.plugins.navigate {home.file."${config.xdg.configHome}/lite-xl/plugins/navigate.lua".source = "${lite-xl-plugins-src}/plugins/navigate.lua";})
    (mkIf cfg.plugins.theme16 {home.file."${config.xdg.configHome}/lite-xl/plugins/theme16".source = "${theme16-src}";})
    (mkIf cfg.plugins.autosaveonfocuslost {home.file."${config.xdg.configHome}/lite-xl/plugins/autosaveonfocuslost.lua".source = "${lite-xl-plugins-src}/plugins/autosaveonfocuslost.lua";})
    (mkIf cfg.plugins.language_caddyfile {home.file."${config.xdg.configHome}/lite-xl/plugins/language_caddyfile.lua".source = "${lite-xl-plugins-src}/plugins/language_caddyfile.lua";})
    (mkIf cfg.plugins.language_psql {home.file."${config.xdg.configHome}/lite-xl/plugins/language_psql.lua".source = "${lite-xl-plugins-src}/plugins/language_psql.lua";})
    (mkIf cfg.plugins.lsp_snippets {
      home.file."${config.xdg.configHome}/lite-xl/plugins/lsp_snippets.lua".source = "${lsp_snippets-src}/lsp_snippets.lua";
      programs.lite-xl.plugins.snippets = true;
      programs.lite-xl.plugins.json = true;
    })
    (mkIf cfg.plugins.language_objc {home.file."${config.xdg.configHome}/lite-xl/plugins/language_objc.lua".source = "${lite-xl-plugins-src}/plugins/language_objc.lua";})
    (mkIf cfg.plugins.language_tsx {home.file."${config.xdg.configHome}/lite-xl/plugins/language_tsx.lua".source = "${lite-xl-plugins-src}/plugins/language_tsx.lua";})
    (mkIf cfg.plugins.ide {
      home.file."${config.xdg.configHome}/lite-xl/plugins/ide.lua".source = "${build-src}/plugins/ide.lua";
      programs.lite-xl.plugins.build = true;
      programs.lite-xl.plugins.debugger = true;
      programs.lite-xl.plugins.lsp_c = true;
      programs.lite-xl.plugins.scm = true;
    })
    (mkIf cfg.plugins.colorpreview {home.file."${config.xdg.configHome}/lite-xl/plugins/colorpreview.lua".source = "${lite-xl-plugins-src}/plugins/colorpreview.lua";})
    (mkIf cfg.plugins.eval {home.file."${config.xdg.configHome}/lite-xl/plugins/eval.lua".source = "${lite-xl-plugins-src}/plugins/eval.lua";})
    (mkIf cfg.plugins.language_ini {home.file."${config.xdg.configHome}/lite-xl/plugins/language_ini.lua".source = "${lite-xl-plugins-src}/plugins/language_ini.lua";})
    (mkIf cfg.plugins.language_tex {home.file."${config.xdg.configHome}/lite-xl/plugins/language_tex.lua".source = "${lite-xl-plugins-src}/plugins/language_tex.lua";})
    (mkIf cfg.plugins.memoryusage {home.file."${config.xdg.configHome}/lite-xl/plugins/memoryusage.lua".source = "${lite-xl-plugins-src}/plugins/memoryusage.lua";})
    (mkIf cfg.plugins.pdfview {home.file."${config.xdg.configHome}/lite-xl/plugins/pdfview.lua".source = "${lite-xl-plugins-src}/plugins/pdfview.lua";})
    (mkIf cfg.plugins.themeselect {home.file."${config.xdg.configHome}/lite-xl/plugins/themeselect.lua".source = "${lite-xl-plugins-src}/plugins/themeselect.lua";})
    (mkIf cfg.plugins.debugger {home.file."${config.xdg.configHome}/lite-xl/plugins/debugger".source = "${build-src}/plugins/debugger";})
    (mkIf cfg.plugins.immersive-title {home.file."${config.xdg.configHome}/lite-xl/plugins/immersive-title".source = "${immersive-title-src}";})
    (mkIf cfg.plugins.language_containerfile {home.file."${config.xdg.configHome}/lite-xl/plugins/language_containerfile".source = "${language_containerfile-src}";})
    (mkIf cfg.plugins.language_fe {home.file."${config.xdg.configHome}/lite-xl/plugins/language_fe.lua".source = "${lite-xl-plugins-src}/plugins/language_fe.lua";})
    (mkIf cfg.plugins.widget {home.file."${config.xdg.configHome}/lite-xl/libraries/widget".source = "${widget-src}";})
    (mkIf cfg.plugins.endwise {home.file."${config.xdg.configHome}/lite-xl/plugins/endwise".source = "${endwise-src}";})
    (mkIf cfg.plugins.language_sh {home.file."${config.xdg.configHome}/lite-xl/plugins/language_sh.lua".source = "${lite-xl-plugins-src}/plugins/language_sh.lua";})
    (mkIf cfg.plugins.snippets {home.file."${config.xdg.configHome}/lite-xl/plugins/snippets.lua".source = "${lsp_snippets-src}/snippets.lua";})
    (mkIf cfg.plugins.open_ext {home.file."${config.xdg.configHome}/lite-xl/plugins/open_ext.lua".source = "${lite-xl-plugins-src}/plugins/open_ext.lua";})
    (mkIf cfg.plugins.markers {home.file."${config.xdg.configHome}/lite-xl/plugins/markers.lua".source = "${lite-xl-plugins-src}/plugins/markers.lua";})
    (mkIf cfg.plugins.nonicons {home.file."${config.xdg.configHome}/lite-xl/plugins/nonicons.lua".source = "${lite-xl-plugins-src}/plugins/nonicons.lua";})
    (mkIf cfg.plugins.scm {
      home.file."${config.xdg.configHome}/lite-xl/plugins/scm".source = "${scm-src}";
      programs.lite-xl.plugins.widget = true;
      programs.lite-xl.plugins.language_diff = true;
      programs.lite-xl.plugins.settings = true;
    })
    (mkIf cfg.plugins.language_toml {home.file."${config.xdg.configHome}/lite-xl/plugins/language_toml.lua".source = "${lite-xl-plugins-src}/plugins/language_toml.lua";})
    (mkIf cfg.plugins.treeview-menu-extender {home.file."${config.xdg.configHome}/lite-xl/plugins/treeview-menu-extender".source = "${treeview-menu-extender-src}";})
    (mkIf cfg.plugins.centerdoc {home.file."${config.xdg.configHome}/lite-xl/plugins/centerdoc.lua".source = "${lite-xl-plugins-src}/plugins/centerdoc.lua";})
    (mkIf cfg.plugins.language_batch {home.file."${config.xdg.configHome}/lite-xl/plugins/language_batch.lua".source = "${lite-xl-plugins-src}/plugins/language_batch.lua";})
    (mkIf cfg.plugins.language_ignore {home.file."${config.xdg.configHome}/lite-xl/plugins/language_ignore.lua".source = "${language_ignore-src}/language_ignore.lua";})
    (mkIf cfg.plugins.language_lobster {home.file."${config.xdg.configHome}/lite-xl/plugins/language_lobster.lua".source = "${lite-xl-plugins-src}/plugins/language_lobster.lua";})
    (mkIf cfg.plugins.gitopen {home.file."${config.xdg.configHome}/lite-xl/plugins/gitopen.lua".source = "${lite-xl-plugins-src}/plugins/gitopen.lua";})
    (mkIf cfg.plugins.language_crystal {home.file."${config.xdg.configHome}/lite-xl/plugins/language_crystal.lua".source = "${language_crystal-src}/language_crystal.lua";})
    (mkIf cfg.plugins.language_java {home.file."${config.xdg.configHome}/lite-xl/plugins/language_java.lua".source = "${lite-xl-plugins-src}/plugins/language_java.lua";})
    (mkIf cfg.plugins.language_make {home.file."${config.xdg.configHome}/lite-xl/plugins/language_make.lua".source = "${lite-xl-plugins-src}/plugins/language_make.lua";})
    (mkIf cfg.plugins.autowrap {home.file."${config.xdg.configHome}/lite-xl/plugins/autowrap.lua".source = "${lite-xl-plugins-src}/plugins/autowrap.lua";})
    (mkIf cfg.plugins.lite-debugger {home.file."${config.xdg.configHome}/lite-xl/plugins/lite-debugger.lua".source = "${lite-xl-plugins-src}/plugins/lite-debugger.lua";})
    (mkIf cfg.plugins.projectsearch {
      home.file."${config.xdg.configHome}/lite-xl/plugins/projectsearch.lua".source = "${findfileimproved-src}/plugins/projectsearch.lua";
      programs.lite-xl.plugins.thread = true;
    })
    (mkIf cfg.plugins.force_syntax {home.file."${config.xdg.configHome}/lite-xl/plugins/force_syntax.lua".source = "${lite-xl-plugins-src}/plugins/force_syntax.lua";})
    (mkIf cfg.plugins.selectionhighlight {home.file."${config.xdg.configHome}/lite-xl/plugins/selectionhighlight.lua".source = "${lite-xl-plugins-src}/plugins/selectionhighlight.lua";})
    (mkIf cfg.plugins.language_nix {home.file."${config.xdg.configHome}/lite-xl/plugins/language_nix.lua".source = "${lite-xl-plugins-src}/plugins/language_nix.lua";})
    (mkIf cfg.plugins.language_ts {home.file."${config.xdg.configHome}/lite-xl/plugins/language_ts.lua".source = "${lite-xl-plugins-src}/plugins/language_ts.lua";})
    (mkIf cfg.plugins.language_yaml {home.file."${config.xdg.configHome}/lite-xl/plugins/language_yaml.lua".source = "${lite-xl-plugins-src}/plugins/language_yaml.lua";})
    (mkIf cfg.plugins.lsp {
      home.file."${config.xdg.configHome}/lite-xl/plugins/lsp".source = "${lsp-src}";
      programs.lite-xl.plugins.widget = true;
      programs.lite-xl.plugins.lintplus = true;
      programs.lite-xl.plugins.settings = true;
    })
    (mkIf cfg.plugins.spellcheck {home.file."${config.xdg.configHome}/lite-xl/plugins/spellcheck.lua".source = "${lite-xl-plugins-src}/plugins/spellcheck.lua";})
    (mkIf cfg.plugins.togglesnakecamel {home.file."${config.xdg.configHome}/lite-xl/plugins/togglesnakecamel.lua".source = "${lite-xl-plugins-src}/plugins/togglesnakecamel.lua";})
    (mkIf cfg.plugins.vibe {home.file."${config.xdg.configHome}/lite-xl/plugins/vibe".source = "${vibe-src}";})
    (mkIf cfg.plugins.kinc-projects {home.file."${config.xdg.configHome}/lite-xl/plugins/kinc-projects".source = "${kinc-projects-src}";})
    (mkIf cfg.plugins.language_gdscript {home.file."${config.xdg.configHome}/lite-xl/plugins/language_gdscript.lua".source = "${lite-xl-plugins-src}/plugins/language_gdscript.lua";})
    (mkIf cfg.plugins.language_go {home.file."${config.xdg.configHome}/lite-xl/plugins/language_go.lua".source = "${lite-xl-plugins-src}/plugins/language_go.lua";})
    (mkIf cfg.plugins.language_teal {home.file."${config.xdg.configHome}/lite-xl/plugins/language_teal.lua".source = "${lite-xl-plugins-src}/plugins/language_teal.lua";})
    (mkIf cfg.plugins.litepresence {home.file."${config.xdg.configHome}/lite-xl/plugins/litepresence".source = "${litepresence-src}";})
    (mkIf cfg.plugins.openselected {home.file."${config.xdg.configHome}/lite-xl/plugins/openselected.lua".source = "${lite-xl-plugins-src}/plugins/openselected.lua";})
    (mkIf cfg.plugins.align_carets {home.file."${config.xdg.configHome}/lite-xl/plugins/align_carets.lua".source = "${lite-xl-plugins-src}/plugins/align_carets.lua";})
    (mkIf cfg.plugins.language_d {home.file."${config.xdg.configHome}/lite-xl/plugins/language_d.lua".source = "${lite-xl-plugins-src}/plugins/language_d.lua";})
    (mkIf cfg.plugins.language_jsx {home.file."${config.xdg.configHome}/lite-xl/plugins/language_jsx.lua".source = "${lite-xl-plugins-src}/plugins/language_jsx.lua";})
    (mkIf cfg.plugins.linter {home.file."${config.xdg.configHome}/lite-xl/plugins/linter_standard.lua".source = "${linter-src}/linter_standard.lua";})
    (mkIf cfg.plugins.language_tal {home.file."${config.xdg.configHome}/lite-xl/plugins/language_tal.lua".source = "${lite-xl-plugins-src}/plugins/language_tal.lua";})
    (mkIf cfg.plugins.sort {home.file."${config.xdg.configHome}/lite-xl/plugins/sort.lua".source = "${lite-xl-plugins-src}/plugins/sort.lua";})
    (mkIf cfg.plugins.wordcount {home.file."${config.xdg.configHome}/lite-xl/plugins/wordcount.lua".source = "${lite-xl-plugins-src}/plugins/wordcount.lua";})
    (mkIf cfg.plugins.build {home.file."${config.xdg.configHome}/lite-xl/plugins/build".source = "${build-src}/plugins/build";})
    (mkIf cfg.plugins.findfileimproved {
      home.file."${config.xdg.configHome}/lite-xl/plugins/findfileimproved.lua".source = "${findfileimproved-src}/plugins/findfileimproved.lua";
      programs.lite-xl.plugins.thread = true;
    })
    (mkIf cfg.plugins.language_diff {home.file."${config.xdg.configHome}/lite-xl/plugins/language_diff.lua".source = "${lite-xl-plugins-src}/plugins/language_diff.lua";})
    (mkIf cfg.plugins.language_odin {home.file."${config.xdg.configHome}/lite-xl/plugins/language_odin.lua".source = "${lite-xl-plugins-src}/plugins/language_odin.lua";})
    (mkIf cfg.plugins.language_zig {home.file."${config.xdg.configHome}/lite-xl/plugins/language_zig.lua".source = "${lite-xl-plugins-src}/plugins/language_zig.lua";})
    (mkIf cfg.plugins.nerdicons {home.file."${config.xdg.configHome}/lite-xl/plugins/nerdicons.lua".source = "${lite-xl-plugins-src}/plugins/nerdicons.lua";})
    (mkIf cfg.plugins.search_ui {
      home.file."${config.xdg.configHome}/lite-xl/plugins/search_ui.lua".source = "${lite-xl-plugins-src}/plugins/search_ui.lua";
      programs.lite-xl.plugins.widget = true;
    })
    (mkIf cfg.plugins.fallbackfonts {home.file."${config.xdg.configHome}/lite-xl/plugins/fallbackfonts".source = "${fallbackfonts-src}";})
    (mkIf cfg.plugins.language_glsl {home.file."${config.xdg.configHome}/lite-xl/plugins/language_glsl.lua".source = "${lite-xl-plugins-src}/plugins/language_glsl.lua";})
    (mkIf cfg.plugins.language_miniscript {home.file."${config.xdg.configHome}/lite-xl/plugins/language_miniscript.lua".source = "${lite-xl-plugins-src}/plugins/language_miniscript.lua";})
    (mkIf cfg.plugins.language_nginx {home.file."${config.xdg.configHome}/lite-xl/plugins/language_nginx.lua".source = "${lite-xl-plugins-src}/plugins/language_nginx.lua";})
    (mkIf cfg.plugins.lfautoinsert {home.file."${config.xdg.configHome}/lite-xl/plugins/lfautoinsert.lua".source = "${lite-xl-plugins-src}/plugins/lfautoinsert.lua";})
    (mkIf cfg.plugins.minimap {home.file."${config.xdg.configHome}/lite-xl/plugins/minimap.lua".source = "${lite-xl-plugins-src}/plugins/minimap.lua";})
    (mkIf cfg.plugins.texcompile {
      home.file."${config.xdg.configHome}/lite-xl/plugins/texcompile.lua".source = "${lite-xl-plugins-src}/plugins/texcompile.lua";
      programs.lite-xl.plugins.console = true;
    })
    (mkIf cfg.plugins.ephemeral_tabs {home.file."${config.xdg.configHome}/lite-xl/plugins/ephemeral_tabs.lua".source = "${lite-xl-plugins-src}/plugins/ephemeral_tabs.lua";})
    (mkIf cfg.plugins.gitdiff_highlight {home.file."${config.xdg.configHome}/lite-xl/plugins/gitdiff_highlight".source = "${gitdiff_highlight-src}";})
    (mkIf cfg.plugins.language_hs {home.file."${config.xdg.configHome}/lite-xl/plugins/language_hs.lua".source = "${lite-xl-plugins-src}/plugins/language_hs.lua";})
    (mkIf cfg.plugins.language_powershell {home.file."${config.xdg.configHome}/lite-xl/plugins/language_powershell.lua".source = "${lite-xl-plugins-src}/plugins/language_powershell.lua";})
    (mkIf cfg.plugins.motiontrail {home.file."${config.xdg.configHome}/lite-xl/plugins/motiontrail.lua".source = "${lite-xl-plugins-src}/plugins/motiontrail.lua";})
    (mkIf cfg.plugins.autosave {home.file."${config.xdg.configHome}/lite-xl/plugins/autosave.lua".source = "${lite-xl-plugins-src}/plugins/autosave.lua";})
    (mkIf cfg.plugins.datetimestamps {home.file."${config.xdg.configHome}/lite-xl/plugins/datetimestamps.lua".source = "${lite-xl-plugins-src}/plugins/datetimestamps.lua";})
    (mkIf cfg.plugins.fontconfig {home.file."${config.xdg.configHome}/lite-xl/plugins/fontconfig.lua".source = "${lite-xl-plugins-src}/plugins/fontconfig.lua";})
    (mkIf cfg.plugins.language_moon {home.file."${config.xdg.configHome}/lite-xl/plugins/language_moon.lua".source = "${lite-xl-plugins-src}/plugins/language_moon.lua";})
    (mkIf cfg.plugins.macmodkeys {home.file."${config.xdg.configHome}/lite-xl/plugins/macmodkeys.lua".source = "${lite-xl-plugins-src}/plugins/macmodkeys.lua";})
    (mkIf cfg.plugins.regexreplacepreview {home.file."${config.xdg.configHome}/lite-xl/plugins/regexreplacepreview.lua".source = "${lite-xl-plugins-src}/plugins/regexreplacepreview.lua";})
    (mkIf cfg.plugins.svg_screenshot {home.file."${config.xdg.configHome}/lite-xl/plugins/svg_screenshot.lua".source = "${lite-xl-plugins-src}/plugins/svg_screenshot.lua";})
    (mkIf cfg.plugins.eofnewline {
      home.file."${config.xdg.configHome}/lite-xl/plugins/eofnewline.lua".source = pkgs.fetchurl {
        url = "https://github.com/bokunodev/lite_modules/blob/master/plugins/eofnewline-xl.lua?raw=1";
        sha256 = "e3607f5107f4e42fd99006289b8214a473824c6973b8e9c637b4657eba763650";
      };
    })
    (mkIf cfg.plugins.language_pony {home.file."${config.xdg.configHome}/lite-xl/plugins/language_pony.lua".source = "${language_pony-src}/language_pony.lua";})
    (mkIf cfg.plugins.language_tcl {home.file."${config.xdg.configHome}/lite-xl/plugins/language_tcl.lua".source = "${lite-xl-plugins-src}/plugins/language_tcl.lua";})
    (mkIf cfg.plugins.language_v {home.file."${config.xdg.configHome}/lite-xl/plugins/language_v.lua".source = "${lite-xl-plugins-src}/plugins/language_v.lua";})
    (mkIf cfg.plugins.primary_selection {home.file."${config.xdg.configHome}/lite-xl/plugins/primary_selection.lua".source = "${lite-xl-plugins-src}/plugins/primary_selection.lua";})
    (mkIf cfg.plugins.ghmarkdown {home.file."${config.xdg.configHome}/lite-xl/plugins/ghmarkdown.lua".source = "${lite-xl-plugins-src}/plugins/ghmarkdown.lua";})
    (mkIf cfg.plugins.language_elm {home.file."${config.xdg.configHome}/lite-xl/plugins/language_elm.lua".source = "${lite-xl-plugins-src}/plugins/language_elm.lua";})
    (mkIf cfg.plugins.language_fstab {home.file."${config.xdg.configHome}/lite-xl/plugins/language_fstab.lua".source = "${lite-xl-plugins-src}/plugins/language_fstab.lua";})
    (mkIf cfg.plugins.language_rescript {home.file."${config.xdg.configHome}/lite-xl/plugins/language_rescript.lua".source = "${lite-xl-plugins-src}/plugins/language_rescript.lua";})
    (mkIf cfg.plugins.gitstatus {home.file."${config.xdg.configHome}/lite-xl/plugins/gitstatus.lua".source = "${lite-xl-plugins-src}/plugins/gitstatus.lua";})
    (mkIf cfg.plugins.language_erb {home.file."${config.xdg.configHome}/lite-xl/plugins/language_erb.lua".source = "${lite-xl-plugins-src}/plugins/language_erb.lua";})
    (mkIf cfg.plugins.language_haxe {home.file."${config.xdg.configHome}/lite-xl/plugins/language_haxe.lua".source = "${lite-xl-plugins-src}/plugins/language_haxe.lua";})
    (mkIf cfg.plugins.language_r {home.file."${config.xdg.configHome}/lite-xl/plugins/language_R.lua".source = "${lite-xl-plugins-src}/plugins/language_R.lua";})
    (mkIf cfg.plugins.keymap_export {home.file."${config.xdg.configHome}/lite-xl/plugins/keymap_export.lua".source = "${lite-xl-plugins-src}/plugins/keymap_export.lua";})
    (mkIf cfg.plugins.lintplus {home.file."${config.xdg.configHome}/lite-xl/plugins/lintplus".source = "${lintplus-src}";})
    (mkIf cfg.plugins.tab_switcher {home.file."${config.xdg.configHome}/lite-xl/plugins/tab_switcher.lua".source = "${lite-xl-plugins-src}/plugins/tab_switcher.lua";})
    (mkIf cfg.plugins.language_pkgbuild {home.file."${config.xdg.configHome}/lite-xl/plugins/language_pkgbuild.lua".source = "${lite-xl-plugins-src}/plugins/language_pkgbuild.lua";})
    (mkIf cfg.plugins.language_rust {home.file."${config.xdg.configHome}/lite-xl/plugins/language_rust.lua".source = "${lite-xl-plugins-src}/plugins/language_rust.lua";})
    (mkIf cfg.plugins.restoretabs {home.file."${config.xdg.configHome}/lite-xl/plugins/restoretabs.lua".source = "${lite-xl-plugins-src}/plugins/restoretabs.lua";})
    (mkIf cfg.plugins.sticky_scroll {home.file."${config.xdg.configHome}/lite-xl/plugins/sticky_scroll.lua".source = "${lite-xl-plugins-src}/plugins/sticky_scroll.lua";})
    (mkIf cfg.plugins.bigclock {home.file."${config.xdg.configHome}/lite-xl/plugins/bigclock.lua".source = "${lite-xl-plugins-src}/plugins/bigclock.lua";})
    (mkIf cfg.plugins.console {home.file."${config.xdg.configHome}/lite-xl/plugins/console".source = "${console-src}";})
    (mkIf cfg.plugins.language_elixir {home.file."${config.xdg.configHome}/lite-xl/plugins/language_elixir.lua".source = "${lite-xl-plugins-src}/plugins/language_elixir.lua";})
    (mkIf cfg.plugins.language_jiyu {home.file."${config.xdg.configHome}/lite-xl/plugins/language_jiyu.lua".source = "${lite-xl-plugins-src}/plugins/language_jiyu.lua";})
    (mkIf cfg.plugins.typingspeed {home.file."${config.xdg.configHome}/lite-xl/plugins/typingspeed.lua".source = "${lite-xl-plugins-src}/plugins/typingspeed.lua";})
    (mkIf cfg.plugins.dragdropselected {home.file."${config.xdg.configHome}/lite-xl/plugins/dragdropselected.lua".source = "${lite-xl-plugins-src}/plugins/dragdropselected.lua";})
    (mkIf cfg.plugins.encodings {
      home.file."${config.xdg.configHome}/lite-xl/plugins/encodings.lua".source = "${encoding-src}/plugins/encodings.lua";
      programs.lite-xl.plugins.encoding = true;
    })
    (mkIf cfg.plugins.language_angelscript {home.file."${config.xdg.configHome}/lite-xl/plugins/language_angelscript.lua".source = "${lite-xl-plugins-src}/plugins/language_angelscript.lua";})
    (mkIf cfg.plugins.language_scala {home.file."${config.xdg.configHome}/lite-xl/plugins/language_scala.lua".source = "${lite-xl-plugins-src}/plugins/language_scala.lua";})
    (mkIf cfg.plugins.language_nim {home.file."${config.xdg.configHome}/lite-xl/plugins/language_nim.lua".source = "${lite-xl-plugins-src}/plugins/language_nim.lua";})
    (mkIf cfg.plugins.lspkind {home.file."${config.xdg.configHome}/lite-xl/plugins/lspkind".source = "${lspkind-src}";})
    (mkIf cfg.plugins.updatechecker {home.file."${config.xdg.configHome}/lite-xl/plugins/updatechecker".source = "${updatechecker-src}";})
    (mkIf cfg.plugins.colorpicker {
      home.file."${config.xdg.configHome}/lite-xl/plugins/colorpicker.lua".source = "${lite-xl-plugins-src}/plugins/colorpicker.lua";
      programs.lite-xl.plugins.widget = true;
    })
    (mkIf cfg.plugins.exec {home.file."${config.xdg.configHome}/lite-xl/plugins/exec.lua".source = "${lite-xl-plugins-src}/plugins/exec.lua";})
    (mkIf cfg.plugins.language_bib {home.file."${config.xdg.configHome}/lite-xl/plugins/language_bib.lua".source = "${lite-xl-plugins-src}/plugins/language_bib.lua";})
    (mkIf cfg.plugins.language_gmi {home.file."${config.xdg.configHome}/lite-xl/plugins/language_gmi.lua".source = "${lite-xl-plugins-src}/plugins/language_gmi.lua";})
    (mkIf cfg.plugins.indent_convert {home.file."${config.xdg.configHome}/lite-xl/plugins/indent_convert.lua".source = "${lite-xl-plugins-src}/plugins/indent_convert.lua";})
    (mkIf cfg.plugins.language_ksy {
      home.file."${config.xdg.configHome}/lite-xl/plugins/language_ksy.lua".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/whiteh0le/lite-plugins/main/plugins/language_ksy.lua?raw=1";
        sha256 = "08a9f8635b09a98cec9dfca8bb65f24fd7b6585c7e8308773e7ddff9a3e5a60f";
      };
    })
    (mkIf cfg.plugins.language_liquid {home.file."${config.xdg.configHome}/lite-xl/plugins/language_liquid.lua".source = "${lite-xl-plugins-src}/plugins/language_liquid.lua";})
    (mkIf cfg.plugins.language_perl {home.file."${config.xdg.configHome}/lite-xl/plugins/language_perl.lua".source = "${lite-xl-plugins-src}/plugins/language_perl.lua";})
    (mkIf cfg.plugins.lorem {home.file."${config.xdg.configHome}/lite-xl/plugins/lorem.lua".source = "${lorem-src}/lorem.lua";})
    (mkIf cfg.plugins.editorconfig {home.file."${config.xdg.configHome}/lite-xl/plugins/editorconfig".source = "${lite-xl-plugins-src}/plugins/editorconfig";})
    (mkIf cfg.plugins.evergreen {home.file."${config.xdg.configHome}/lite-xl/plugins/evergreen".source = "${evergreen-src}";})
    (mkIf cfg.plugins.language_assembly_x86 {home.file."${config.xdg.configHome}/lite-xl/plugins/language_assembly_x86.lua".source = "${lite-xl-plugins-src}/plugins/language_assembly_x86.lua";})
    (mkIf cfg.plugins.language_assembly_riscv {home.file."${config.xdg.configHome}/lite-xl/plugins/language_assembly_riscv.lua".source = "${lite-xl-plugins-src}/plugins/language_assembly_riscv.lua";})
    (mkIf cfg.plugins.gitblame {home.file."${config.xdg.configHome}/lite-xl/plugins/gitblame".source = "${gitblame-src}";})
    (mkIf cfg.plugins.language_autohotkey_v1 {home.file."${config.xdg.configHome}/lite-xl/plugins/language_autohotkey_v1.lua".source = "${lite-xl-plugins-src}/plugins/language_autohotkey_v1.lua";})
    (mkIf cfg.plugins.language_blade {home.file."${config.xdg.configHome}/lite-xl/plugins/language_blade.lua".source = "${lite-xl-plugins-src}/plugins/language_blade.lua";})
    (mkIf cfg.plugins.equationgrapher {home.file."${config.xdg.configHome}/lite-xl/plugins/equationgrapher.lua".source = "${equationgrapher-src}/equationgrapher.lua";})
    (mkIf cfg.plugins.extend_selection_line {home.file."${config.xdg.configHome}/lite-xl/plugins/extend_selection_line.lua".source = "${lite-xl-plugins-src}/plugins/extend_selection_line.lua";})
    (mkIf cfg.plugins.unboundedscroll {home.file."${config.xdg.configHome}/lite-xl/plugins/unboundedscroll.lua".source = "${lite-xl-plugins-src}/plugins/unboundedscroll.lua";})
    (mkIf cfg.plugins.select_colorscheme {home.file."${config.xdg.configHome}/lite-xl/plugins/select_colorscheme.lua".source = "${lite-xl-plugins-src}/plugins/select_colorscheme.lua";})
    (mkIf cfg.plugins.statusclock {home.file."${config.xdg.configHome}/lite-xl/plugins/statusclock.lua".source = "${lite-xl-plugins-src}/plugins/statusclock.lua";})
    (mkIf cfg.plugins.language_fennel {home.file."${config.xdg.configHome}/lite-xl/plugins/language_fennel.lua".source = "${lite-xl-plugins-src}/plugins/language_fennel.lua";})
    (mkIf cfg.plugins.language_julia {home.file."${config.xdg.configHome}/lite-xl/plugins/language_julia.lua".source = "${lite-xl-plugins-src}/plugins/language_julia.lua";})
    (mkIf cfg.plugins.linenumbers {home.file."${config.xdg.configHome}/lite-xl/plugins/linenumbers.lua".source = "${lite-xl-plugins-src}/plugins/linenumbers.lua";})
    (mkIf cfg.plugins.rainbowparen {home.file."${config.xdg.configHome}/lite-xl/plugins/rainbowparen.lua".source = "${lite-xl-plugins-src}/plugins/rainbowparen.lua";})
    (mkIf cfg.plugins.language_meson {home.file."${config.xdg.configHome}/lite-xl/plugins/language_meson.lua".source = "${lite-xl-plugins-src}/plugins/language_meson.lua";})
    (mkIf cfg.plugins.language_wren {home.file."${config.xdg.configHome}/lite-xl/plugins/language_wren.lua".source = "${lite-xl-plugins-src}/plugins/language_wren.lua";})
    (mkIf cfg.plugins.smoothcaret {home.file."${config.xdg.configHome}/lite-xl/plugins/smoothcaret.lua".source = "${lite-xl-plugins-src}/plugins/smoothcaret.lua";})
    (mkIf cfg.plugins.tabnumbers {home.file."${config.xdg.configHome}/lite-xl/plugins/tabnumbers.lua".source = "${lite-xl-plugins-src}/plugins/tabnumbers.lua";})
    (mkIf cfg.plugins.profiler {home.file."${config.xdg.configHome}/lite-xl/plugins/profiler".source = "${lite-xl-plugins-src}/plugins/profiler";})
    (mkIf cfg.plugins.autoinsert {home.file."${config.xdg.configHome}/lite-xl/plugins/autoinsert.lua".source = "${lite-xl-plugins-src}/plugins/autoinsert.lua";})
    (mkIf cfg.plugins.copyfilelocation {home.file."${config.xdg.configHome}/lite-xl/plugins/copyfilelocation.lua".source = "${lite-xl-plugins-src}/plugins/copyfilelocation.lua";})
    (mkIf cfg.plugins.ipc {home.file."${config.xdg.configHome}/lite-xl/plugins/ipc.lua".source = "${lite-xl-plugins-src}/plugins/ipc.lua";})
    (mkIf cfg.plugins.language_gabc {home.file."${config.xdg.configHome}/lite-xl/plugins/language_gabc.lua".source = "${lite-xl-plugins-src}/plugins/language_gabc.lua";})
    (mkIf cfg.plugins.gofmt {home.file."${config.xdg.configHome}/lite-xl/plugins/gofmt.lua".source = "${lite-xl-plugins-src}/plugins/gofmt.lua";})
    (mkIf cfg.plugins.language_pico8 {home.file."${config.xdg.configHome}/lite-xl/plugins/language_pico8.lua".source = "${lite-xl-plugins-src}/plugins/language_pico8.lua";})
    (mkIf cfg.plugins.language_po {home.file."${config.xdg.configHome}/lite-xl/plugins/language_po.lua".source = "${lite-xl-plugins-src}/plugins/language_po.lua";})
    (mkIf cfg.plugins.language_ruby {home.file."${config.xdg.configHome}/lite-xl/plugins/language_ruby.lua".source = "${lite-xl-plugins-src}/plugins/language_ruby.lua";})
    (mkIf cfg.plugins.black {home.file."${config.xdg.configHome}/lite-xl/plugins/black".source = "${black-src}";})
    (mkIf cfg.plugins.bracketmatch {home.file."${config.xdg.configHome}/lite-xl/plugins/bracketmatch.lua".source = "${lite-xl-plugins-src}/plugins/bracketmatch.lua";})
    (mkIf cfg.plugins.discord-presence {home.file."${config.xdg.configHome}/lite-xl/plugins/discord-presence".source = "${discord-presence-src}";})
    (mkIf cfg.plugins.exterm {home.file."${config.xdg.configHome}/lite-xl/plugins/exterm.lua".source = "${exterm-src}/exterm.lua";})
    (mkIf cfg.plugins.scalestatus {home.file."${config.xdg.configHome}/lite-xl/plugins/scalestatus.lua".source = "${lite-xl-plugins-src}/plugins/scalestatus.lua";})
    (mkIf cfg.plugins.settings {
      home.file."${config.xdg.configHome}/lite-xl/plugins/settings.lua".source = "${lite-xl-plugins-src}/plugins/settings.lua";
      programs.lite-xl.plugins.widget = true;
    })
    (mkIf cfg.plugins.smallclock {home.file."${config.xdg.configHome}/lite-xl/plugins/smallclock.lua".source = "${lite-xl-plugins-src}/plugins/smallclock.lua";})
    (mkIf cfg.plugins.todotreeview {home.file."${config.xdg.configHome}/lite-xl/plugins/todotreeview-xl.lua".source = "${todotreeview-src}/todotreeview-xl.lua";})
    (mkIf cfg.plugins.openfilelocation {home.file."${config.xdg.configHome}/lite-xl/plugins/openfilelocation.lua".source = "${lite-xl-plugins-src}/plugins/openfilelocation.lua";})
    (mkIf cfg.plugins.visu {home.file."${config.xdg.configHome}/lite-xl/plugins/visu".source = "${visu-src}";})
    (mkIf cfg.plugins.language_env {home.file."${config.xdg.configHome}/lite-xl/plugins/language_env.lua".source = "${language_env-src}/language_env.lua";})
    (mkIf cfg.plugins.language_hlsl {home.file."${config.xdg.configHome}/lite-xl/plugins/language_hlsl.lua".source = "${lite-xl-plugins-src}/plugins/language_hlsl.lua";})
    (mkIf cfg.plugins.language_sass {home.file."${config.xdg.configHome}/lite-xl/plugins/language_sass.lua".source = "${lite-xl-plugins-src}/plugins/language_sass.lua";})
    (mkIf cfg.plugins.language_ssh_config {home.file."${config.xdg.configHome}/lite-xl/plugins/language_ssh_config.lua".source = "${lite-xl-plugins-src}/plugins/language_ssh_config.lua";})
    (mkIf cfg.plugins.custom_caret {home.file."${config.xdg.configHome}/lite-xl/plugins/custom_caret.lua".source = "${lite-xl-plugins-src}/plugins/custom_caret.lua";})
    (mkIf cfg.plugins.formatter {home.file."${config.xdg.configHome}/lite-xl/plugins/formatter_htmlbeautify.lua".source = "${formatter-src}/formatter_htmlbeautify.lua";})
    (mkIf cfg.plugins.smartopenselected {home.file."${config.xdg.configHome}/lite-xl/plugins/smartopenselected.lua".source = "${lite-xl-plugins-src}/plugins/smartopenselected.lua";})
    (mkIf cfg.plugins.opacity {home.file."${config.xdg.configHome}/lite-xl/plugins/opacity.lua".source = "${lite-xl-plugins-src}/plugins/opacity.lua";})
    (mkIf cfg.plugins.titleize {home.file."${config.xdg.configHome}/lite-xl/plugins/titleize.lua".source = "${lite-xl-plugins-src}/plugins/titleize.lua";})
    (mkIf cfg.plugins.indentguide {home.file."${config.xdg.configHome}/lite-xl/plugins/indentguide.lua".source = "${lite-xl-plugins-src}/plugins/indentguide.lua";})
    (mkIf cfg.plugins.language_cmake {home.file."${config.xdg.configHome}/lite-xl/plugins/language_cmake.lua".source = "${lite-xl-plugins-src}/plugins/language_cmake.lua";})
    (mkIf cfg.plugins.language_lilypond {home.file."${config.xdg.configHome}/lite-xl/plugins/language_lilypond.lua".source = "${lite-xl-plugins-src}/plugins/language_lilypond.lua";})
    (mkIf cfg.plugins.language_php {home.file."${config.xdg.configHome}/lite-xl/plugins/language_php.lua".source = "${lite-xl-plugins-src}/plugins/language_php.lua";})
    (mkIf cfg.plugins.language_csharp {home.file."${config.xdg.configHome}/lite-xl/plugins/language_csharp.lua".source = "${lite-xl-plugins-src}/plugins/language_csharp.lua";})
    (mkIf cfg.plugins.language_dart {home.file."${config.xdg.configHome}/lite-xl/plugins/language_dart.lua".source = "${lite-xl-plugins-src}/plugins/language_dart.lua";})
    (mkIf cfg.plugins.language_htaccess {home.file."${config.xdg.configHome}/lite-xl/plugins/language_htaccess.lua".source = "${lite-xl-plugins-src}//plugins/language_htaccess.lua";})
    (mkIf cfg.plugins.language_rivet {home.file."${config.xdg.configHome}/lite-xl/plugins/language_rivet.lua".source = "${lite-xl-plugins-src}/plugins/language_rivet.lua";})
    # dummy dependencies
    {
      assertions = [
        {
          assertion = !cfg.plugins.lsp_c;
          message = "lsp_c is only a dummy";
        }
        {
          assertion = !cfg.plugins.encoding;
          message = "encoding is only a dummy";
        }
        {
          assertion = !cfg.plugins.json;
          message = "json is only a dummy";
        }
        {
          assertion = !cfg.plugins.thread;
          message = "thread is only a dummy";
        }
      ];
    }
  ]);
}
