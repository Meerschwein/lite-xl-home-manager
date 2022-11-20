{
  pkgs,
  config,
  lib,
}:
with lib; let
  cfg = config.programs.lite-xl;

  configDirectory = "${config.xdg.configHome}/lite-xl";
  pluginDirectory = "${configDirectory}/plugins";

  lite-xl-plugins = import ./repos/lite-xl-plugins.nix {inherit pkgs;};

  externalRepos = import ./repos/external-github-repos.nix {inherit pkgs;} // import ./other-repos.nix {inherit pkgs;};

  pluginEnableOption = name: description: {
    options.programs.lite-xl.plugins."${name}" = mkEnableOption description;
  };

  linkFileFromPluginsIntoPluginDir = filename: {
    home.file."${pluginDirectory}/${filename}".source = "${lite-xl-plugins}/plugins/${filename}";
  };

  # A file named ${name}.lua must be in the lite-xl plugins dir
  mkSimplePlugin = {
    name,
    description,
    extraOptions ? {},
    extraConfig ? {},
  }: {
    inherit name description;
    options = recursiveUpdate (pluginEnableOption name description) extraOptions;
    config = mkIf cfg.plugins.${name} (mkMerge [
      (linkFileFromPluginsIntoPluginDir "${name}.lua")
      extraConfig
    ]);
  };

  # The whole repository gets linked into the plugin directory
  # So it is needs to be a plugin with an init.lua file in there
  mkSimplePluginExternalRepo = {
    name,
    description,
    extraOptions ? {},
    extraConfig ? {},
  }: {
    inherit name description;
    options = recursiveUpdate (pluginEnableOption name description) extraOptions;
    config = mkIf cfg.plugins.${name} (mkMerge [
      {
        home.file."${pluginDirectory}/${name}" = {
          recursive = true;
          source = externalRepos.${name};
        };
      }
      extraConfig
    ]);
  };

  # Only takes a file with ${name} from externalRepos.${name}
  mkPluginSingleFileInExternalRepo = {
    name,
    description,
    extraOptions ? {},
    extraConfig ? {},
  }: {
    inherit name description;
    options = pluginEnableOption name description;
    config = mkIf cfg.plugins.${name} {
      home.file."${pluginDirectory}/${name}.lua".source = "${externalRepos.${name}}/${name}.lua";
    };
  };
in [
  (
    mkSimplePlugin {
      name = "align_carets";
      description = "Align multiple carets and selections *([clip](https://user-images.githubusercontent.com/2798487/165631951-532f8d24-d596-4dd0-9d21-ff53c71ed32f.mp4))*";
    }
  )
  (
    mkSimplePlugin {
      name = "autoinsert";
      description = "Automatically inserts closing brackets and quotes. Also allows selected text to be wrapped with brackets or quotes.";
    }
  )
  (
    mkSimplePlugin {
      name = "autosave";
      description = "Automatically saves files when they are changed";
    }
  )
  (
    mkSimplePlugin {
      name = "autosaveonfocuslost";
      description = "Automatically saves files that were changed when the main window loses focus by switching to another application";
    }
  )
  (
    mkSimplePlugin {
      name = "autowrap";
      description = "Automatically hardwraps lines when typing";
    }
  )
  (
    mkSimplePlugin {
      name = "bigclock";
      description = "Shows the current time and date in a view with large text *([screenshot](https://user-images.githubusercontent.com/3920290/82752891-3318df00-9db9-11ea-803f-261d80d5cf53.png))*";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "black";
      description = "Integrates the [black](https://github.com/psf/black) Python formatter with lite";
      extraConfig = {home.packages = [pkgs.black];};
    }
  )
  (
    mkSimplePlugin {
      name = "bracketmatch";
      description = "Underlines matching pair for bracket under the caret *([screenshot](https://user-images.githubusercontent.com/3920290/80132745-0c863f00-8594-11ea-8875-c455c6fd7eae.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "centerdoc";
      description = "Centers document's content on the screen and adds zen mode support *([screenshot](https://user-images.githubusercontent.com/3920290/82127896-bf6e4500-97ae-11ea-97fc-ba9a552bc9a4.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "colorpreview";
      description = "Underlays color values (eg. `#ff00ff` or `rgb(255, 0, 255)`) with their resultant color. *([screenshot](https://user-images.githubusercontent.com/3920290/80743752-731bd780-8b15-11ea-97d3-847db927c5dc.png))*";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "console";
      description = "A console for running external commands and capturing their output *([gif](https://user-images.githubusercontent.com/3920290/81343656-49325a00-90ad-11ea-8647-ff39d8f1d730.gif))*";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "contextmenu";
      description = "Simple context menu *([screenshot](https://github.com/takase1121/lite-contextmenu/blob/master/assets/screenshot.jpg?raw=true))*";
    }
  )
  (
    mkSimplePlugin {
      name = "copyfilelocation";
      description = "Copy file location to clipboard";
    }
  )
  (
    mkSimplePlugin {
      name = "datetimestamps";
      description = "Insert date-, time- and date-time-stamps";
    }
  )
  # UNIMPLEMENTED
  # "discord-presence"
  # "Adds the current workspace and file to your Discord Rich Presence"
  (
    mkSimplePlugin {
      name = "dragdropselected";
      description = "Provides basic drag and drop of selected text (in same document)";
    }
  )
  rec {
    name = "eofnewline";
    description = "Make sure the file ends with one blank line.";
    options = pluginEnableOption name description;
    config = mkIf cfg.plugins.eofnewline {
      home.file."${pluginDirectory}/eofnewline.lua".source = "${externalRepos.eofnewline}/plugins/eofnewline-xl.lua";
    };
  }
  (
    mkSimplePlugin {
      name = "ephemeral_tabs";
      description = "Preview tabs. Opening a doc will replace the contents of the preview tab. Marks tabs as non-preview on any change or tab double clicking.";
    }
  )
  (
    mkPluginSingleFileInExternalRepo {
      name = "equationgrapher";
      description = "Graphs y=x equations.";
    }
  )
  (
    mkSimplePlugin {
      name = "eval";
      description = "Replaces selected Lua code with its evaluated result";
    }
  )
  (
    mkSimplePlugin {
      name = "exec";
      description = "Runs selected text through shell command and replaces with result";
    }
  )
  (
    mkSimplePlugin {
      name = "extend_selection_line";
      description = "When a selection crosses multiple lines, it is drawn to the end of the screen *([screenshot](https://user-images.githubusercontent.com/2798487/140995616-89a20b55-5917-4df8-8a7c-d7c53732fa8b.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "exterm";
      description = "Allows to open an external console in current project directory";
    }
  )
  # UNIMPLEMENTED
  # "fallbackfonts"
  # "Adds support for fallback fonts *([gif](https://raw.githubusercontent.com/takase1121/lite-fallback-fonts/master/assets/Iw18fI57J0.gif))*"
  (
    mkSimplePlugin {
      name = "fontconfig";
      description = "Allows users to load fonts with [fontconfig](https://www.freedesktop.org/software/fontconfig/fontconfig-user.html).";
    }
  )
  (
    mkSimplePlugin {
      name = "force_syntax";
      description = "Change the syntax used for a file.";
    }
  )
  (let
    formatterconfigs = mapAttrsToList (name: packages: {inherit name packages;}) {
      "black" = [pkgs.black];
      "clangformat" = [pkgs.clang_13];
      "cmakeformat" = [pkgs.cmake-format];
      "cssbeautify" = [pkgs.nodePackages.js-beautify];
      "dartformat" = [pkgs.dart];
      "dfmt" = [pkgs.dfmt];
      "esformatter" = []; # Not found in nixpkgs
      "gdformat" = [pkgs.python39Packages.gdtoolkit];
      "goimports" = []; # Not found in nixpkgs
      "html-beautify" = [pkgs.nodePackages.js-beautify];
      "js-beautify" = [pkgs.nodePackages.js-beautify];
      "luaformatter" = [pkgs.luaformatter];
      "qmlformat" = []; # Not found in nixpkgs
      "rustfmt" = [pkgs.rustfmt];
      "zigfmt" = [pkgs.zig];
    };
  in rec {
    name = "formatter";
    description = "formatters for various languages";
    options = {
      options.programs.lite-xl.plugins.formatter = mkEnableOption description;
      options.programs.lite-xl.formatter = builtins.listToAttrs (map (c: {
          name = c.name;
          value = mkEnableOption "";
        })
        formatterconfigs);
    };
    config = mkIf (cfg.plugins.formatter || any (c: cfg.formatter.${c.name}) formatterconfigs) (mkMerge [
      {home.file."${pluginDirectory}/formatter.lua".source = "${externalRepos.formatter}/formatter.lua";}

      (mkIf cfg.formatter.esformatter {warnings = ["esformatter was not found in nixpkgs you have install it on your own!"];})
      (mkIf cfg.formatter.goimports {warnings = ["goimports was not found in nixpkgs you have install it on your own!"];})
      (mkIf cfg.formatter.qmlformat {warnings = ["qmlformat was not found in nixpkgs you have install it on your own!"];})

      (mkMerge (map (c:
        mkIf cfg.formatter.${c.name} {
          home.packages = c.packages;
          home.file."${pluginDirectory}/formatter_${c.name}.lua".source = "${externalRepos.formatter}/formatter_${c.name}.lua";
        })
      formatterconfigs))
    ]);
  })
  (
    mkSimplePlugin {
      name = "ghmarkdown";
      description = "Opens a preview of the current markdown file in a browser window *([screenshot](https://user-images.githubusercontent.com/3920290/82754898-f7394600-9dc7-11ea-8278-2305363ed372.png))*";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "gitblame";
      description = "Shows git blame information of a line *([screenshot](https://raw.githubusercontent.com/juliardi/lite-xl-gitblame/main/screenshot_1.png))*";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "gitdiff_highlight";
      description = "highlight changed lines from git *([screenshot](https://raw.githubusercontent.com/vincens2005/lite-xl-gitdiff-highlight/master/screenshot.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "gitstatus";
      description = "Displays git branch and insert/delete count in status bar *([screenshot](https://user-images.githubusercontent.com/3920290/81107223-bcea3080-8f0e-11ea-8fc7-d03173f42e33.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "gofmt";
      description = "Auto-formats the current go file, adds the missing imports and the missing return cases";
    }
  )
  # UNIMPLEMENTED
  # "immersive-title"
  # "Dark (or even Mica!) title bar for Lite XL"
  (
    mkSimplePlugin {
      name = "indent_convert";
      description = "Convert between tabs and spaces indentation";
    }
  )
  (
    mkSimplePlugin {
      name = "indentguide";
      description = "Adds indent guides *([screenshot](https://user-images.githubusercontent.com/3920290/79640716-f9860000-818a-11ea-9c3b-26d10dd0e0c0.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "ipc";
      description = "Adds inter-process communication support";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "kinc_projects";
      description = "Adds [Kinc](https://github.com/Kode/Kinc) Project generation with basic build commands(depends on [`console`](https://github.com/franko/console))";
      extraConfig = {programs.lite-xl.plugins.console = true;};
    }
  )
  (
    mkSimplePlugin {
      name = "language_angelscript";
      description = "Syntax for the [Angelscript](https://www.angelcode.com/angelscript/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_assembly_x86";
      description = "Syntax for Intel x86 assembly";
    }
  )
  (
    mkPluginSingleFileInExternalRepo {
      name = "language_autohotkey";
      description = "Syntax for the [AutoHotkey](https://www.autohotkey.com) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_batch";
      description = "Syntax for Windows [Batch Files](https://en.wikipedia.org/wiki/Batch_file)";
    }
  )
  (
    mkSimplePlugin {
      name = "language_bib";
      description = "Syntax for [BibTex](https://en.wikipedia.org/wiki/BibTeX) files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_caddyfile";
      description = "Syntax for the Caddyfile used on the [Caddy](https://caddyserver.com/) web server";
    }
  )
  (
    mkSimplePlugin {
      name = "language_cmake";
      description = "Syntax for the CMake build system language";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "language_containerfile";
      description = "Syntax for [Containerfile](https://github.com/containers/common/blob/main/docs/Containerfile.5.md)/[Dockerfile](https://docs.docker.com/engine/reference/builder/)";
    }
  )
  (
    mkPluginSingleFileInExternalRepo {
      name = "language_crystal";
      description = "Syntax for the [Crystal](https://crystal-lang.org) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_csharp";
      description = "Syntax for the [C#](http://csharp.net) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_d";
      description = "Syntax for the [D](https://dlang.org/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_dart";
      description = "Syntax for the [Dart](https://dart.dev/) programming languiage";
    }
  )
  (
    mkSimplePlugin {
      name = "language_diff";
      description = "Syntax for diff and patch files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_elixir";
      description = "Syntax for the [Elixir](https://elixir-lang.org) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_elm";
      description = "Syntax for the [Elm](https://elm-lang.org) programming language";
    }
  )
  (
    mkPluginSingleFileInExternalRepo {
      name = "language_env";
      description = "Syntax for the [env](https://hexdocs.pm/dotenvy/dotenv-file-format.html) (dotenv) files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_erb";
      description = "Syntax for the [ERB](https://github.com/ruby/erb) programming language. Also known as eRuby or Embedded Ruby.";
    }
  )
  (
    mkSimplePlugin {
      name = "language_fe";
      description = "Syntax for the [fe](https://github.com/rxi/fe) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_fennel";
      description = "Syntax for the [fennel](https://fennel-lang.org) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_fstab";
      description = "Syntax for the [fstab](https://en.wikipedia.org/wiki/Fstab) config files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_gdscript";
      description = "Syntax for the [Godot Engine](https://godotengine.org/)'s GDScript scripting language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_glsl";
      description = "Syntax for the [GLSL](https://www.khronos.org/registry/OpenGL/specs/gl/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_gmi";
      description = "Syntax for the [Gemtext](https://gemini.circumlunar.space/docs/gemtext.gmi) markup language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_go";
      description = "Syntax for the [Go](https://golang.org/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_hlsl";
      description = "Syntax for the [HLSL](https://docs.microsoft.com/en-us/windows/win32/direct3dhlsl/dx-graphics-hlsl) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_hs";
      description = "Syntax for the [Haskell](https://www.haskell.org/) programming language";
    }
  )
  (
    mkPluginSingleFileInExternalRepo {
      name = "language_ignore";
      description = "Syntax for [.gitignore](https://git-scm.com/docs/gitignore), [.dockerignore](https://docs.docker.com/engine/reference/builder/#dockerignore-file) and some other `.*ignore` files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_ini";
      description = "Syntax for [ini](https://en.wikipedia.org/wiki/INI_file) files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_java";
      description = "Syntax for the [Java](https://en.wikipedia.org/wiki/Java_\(programming_language\)) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_jiyu";
      description = "Syntax for the [jiyu](https://github.com/machinamentum/jiyu) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_jsx";
      description = "Syntax for the [JSX](https://reactjs.org/docs/introducing-jsx.html) language for the React framework in JavaScript";
    }
  )
  (
    mkSimplePlugin {
      name = "language_julia";
      description = "Syntax for the [Julia](https://julialang.org/) programming language";
    }
  )
  rec {
    name = "language_ksy";
    description = "Syntax for [Kaitai](http://kaitai.io/) struct files";
    options = pluginEnableOption name description;
    config = mkIf cfg.plugins.language_ksy {
      home.file."${pluginDirectory}/language_ksy.lua".source = "${externalRepos.language_ksy}/plugins/language_ksy.lua";
    };
  }
  (
    mkSimplePlugin {
      name = "language_liquid";
      description = "Syntax for [Liquid](https://shopify.github.io/liquid/) templating language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_lobster";
      description = "Syntax for [Lobster](https://strlen.com/lobster/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_make";
      description = "Syntax for the Make build system language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_meson";
      description = "Syntax for the [Meson](https://mesonbuild.com) build system language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_miniscript";
      description = "Syntax for the [MiniScript](https://miniscript.org) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_moon";
      description = "Syntax for the [MoonScript](https://moonscript.org) scripting language";
    }
  )
  (
    mkPluginSingleFileInExternalRepo {
      name = "language_nelua";
      description = "Syntax for [Nelua](http://nelua.io/) programming";
    }
  )
  (
    mkSimplePlugin {
      name = "language_nginx";
      description = "Syntax for [Nginx](https://www.nginx.com/) config files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_nim";
      description = "Syntax for the [Nim](https://nim-lang.org) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_objc";
      description = "Syntax for the [Objective C](https://en.wikipedia.org/wiki/Objective-C) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_odin";
      description = "Syntax for the [Odin](https://github.com/odin-lang/Odin) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_perl";
      description = "Syntax for the [Perl](https://perl.org) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_php";
      description = "Syntax for the [PHP](https://php.net) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_pico8";
      description = "Syntax for [Pico-8](https://www.lexaloffle.com/pico-8.php) cartridge files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_pkgbuild";
      description = "Syntax for [PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD) package description files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_po";
      description = "Syntax for [PO](https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html) translation files";
    }
  )
  (
    mkPluginSingleFileInExternalRepo {
      name = "language_pony";
      description = "Syntax for [Pony](https://www.ponylang.io/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_powershell";
      description = "Syntax for [PowerShell](https://docs.microsoft.com/en-us/powershell) scripting language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_psql";
      description = "Syntax for the postgresql database access language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_r";
      description = "Syntax for [R](https://www.r-project.org/) scripting language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_rescript";
      description = "Syntax for the [ReScript](https://rescript-lang.org/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_rivet";
      description = "Syntax for the [Rivet](https://github.com/rivet-lang/rivet) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_ruby";
      description = "Syntax for the [Ruby](https://www.ruby-lang.org/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_rust";
      description = "Syntax for the [Rust](https://rust-lang.org/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_sass";
      description = "Syntax for the [Sass](https://sass-lang.com/) CSS preprocessor";
    }
  )
  (
    mkSimplePlugin {
      name = "language_scala";
      description = "Syntax for the [Scala](https://scala-lang.org/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_sh";
      description = "Syntax for shell scripting language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_ssh_config";
      description = "Syntax for ssh & sshd config files";
    }
  )
  (
    mkSimplePlugin {
      name = "language_tcl";
      description = "Syntax for the [Tcl](https://www.tcl.tk/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_teal";
      description = "Syntax for the [Teal](https://github.com/teal-language/tl) programming language, a typed dialect of Lua.";
    }
  )
  (
    mkSimplePlugin {
      name = "language_tex";
      description = "Syntax for the [LaTeX](https://www.latex-project.org/) typesetting language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_toml";
      description = "Syntax for the [TOML](https://toml.io/en/) configuration language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_ts";
      description = "Syntax for the [TypeScript](https://www.typescriptlang.org/) programming language, a typed dialect of JavaScript.";
    }
  )
  (
    mkSimplePlugin {
      name = "language_tsx";
      description = "Syntax for [TSX](https://www.typescriptlang.org/docs/handbook/jsx.html) language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_v";
      description = "Syntax for the [V](https://vlang.io/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_wren";
      description = "Syntax for the [Wren](http://wren.io/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_yaml";
      description = "Syntax for [YAML](https://yaml.org/) serialization language";
    }
  )
  (
    mkSimplePlugin {
      name = "language_zig";
      description = "Syntax for the [Zig](https://ziglang.org/) programming language";
    }
  )
  (
    mkSimplePlugin {
      name = "lfautoinsert";
      description = "Automatically inserts indentation and closing bracket/text after newline";
    }
  )
  (
    mkSimplePlugin {
      name = "linenumbers";
      description = "The ability to change the display of the line number *([screenshot](https://user-images.githubusercontent.com/5556081/129493788-6a4cbd7a-9074-4133-bab7-110ed55f18f7.png))*";
    }
  )
  (let
    linterconfigs = mapAttrsToList (name: packages: {inherit name packages;}) {
      "luacheck" = [pkgs.lua53Packages.luacheck];
      "nelua" = []; # Not found in nixpkgs
      "nim" = [pkgs.nim];
      "php" = [pkgs.php];
      "python" = [pkgs.python310Packages.flake8];
      "rust" = with pkgs; [cargo clippy];
      "shellcheck" = [pkgs.shellcheck];
      "v" = [pkgs.vlang];
      "zig" = [pkgs.zig];
    };
  in rec {
    name = "lintplus";
    description = "Advanced linter with ErrorLens-like error reporting. Compatible with linters made for `linter` *([screenshot](https://raw.githubusercontent.com/liquid600pgm/lintplus/master/screenshots/1.png))*";
    options = {
      options.programs.lite-xl.plugins.lintplus = mkEnableOption description;
      options.programs.lite-xl.lintplus = builtins.listToAttrs (map (c: {
          name = c.name;
          value = mkEnableOption "";
        })
        linterconfigs);
    };
    config = mkIf (cfg.plugins.lintplus || any (c: cfg.lintplus.${c.name}) linterconfigs) (mkMerge [
      {
        home.file."${pluginDirectory}/lintplus" = {
          recursive = true;
          source = externalRepos.lintplus;
        };
      }

      (mkIf cfg.lintplus.nelua {warnings = ["nelua was not found in nixpkgs you have install it on your own!"];})

      (mkIf (any (c: cfg.lintplus.${c.name}) linterconfigs) {
        programs.lite-xl.hm-module-plugin-before = ''local lintplus = require "plugins.lintplus"'';
      })

      {
        programs.lite-xl.hm-module-plugin = concatStrings (map (c:
          if cfg.lintplus.${c.name}
          then "lintplus.load(\"${c.name}\")\n"
          else "")
        linterconfigs);
      }
    ]);
  })
  (let
    linterconfigs = mapAttrsToList (name: packages: {inherit name packages;}) {
      "ameba" = [pkgs.ameba];
      "dscanner" = []; # Not found in nixpkgs
      "eslint" = [pkgs.nodePackages.eslint];
      "flake8" = [pkgs.python310Packages.flake8];
      "gocompiler" = [pkgs.go];
      "golint" = [pkgs.golint];
      "jshint" = [pkgs.nodePackages.jshint];
      "luacheck" = [pkgs.lua53Packages.luacheck];
      "teal" = [pkgs.luajitPackages.tl];
      "nim" = [pkgs.nim];
      "php" = [pkgs.php];
      "pylint" = [pkgs.pylint];
      "revive" = [pkgs.revive]; # as of nixpkgs 22.05 in unstable
      "selene" = [pkgs.selene];
      "shellcheck" = [pkgs.shellcheck];
      "standard" = []; # Not found in nixpkgs
      "zig" = [pkgs.zig];
    };
  in rec {
    name = "linter";
    description = "Linters for multiple languages";
    options = {
      options.programs.lite-xl.plugins.linter = mkEnableOption description;
      options.programs.lite-xl.linter = builtins.listToAttrs (map (c: {
          name = c.name;
          value = mkEnableOption "";
        })
        linterconfigs);
    };
    config = mkIf (cfg.plugins.linter || any (c: cfg.linter.${c.name}) linterconfigs) (mkMerge [
      {home.file."${pluginDirectory}/linter.lua".source = "${externalRepos.linter}/linter.lua";}

      (mkIf cfg.linter.dscanner {warnings = ["dscanner was not found in nixpkgs you have install it on your own!"];})
      (mkIf cfg.linter.standard {warnings = ["standard was not found in nixpkgs you have install it on your own!"];})

      (mkMerge (map (c:
        mkIf cfg.linter.${c.name} {
          home.packages = c.packages;
          home.file."${pluginDirectory}/linter_${c.name}.lua".source = "${externalRepos.linter}/linter_${c.name}.lua";
        })
      linterconfigs))
    ]);
  })
  # UNIMPLEMENTED
  # "litepresence"
  # "Discord rich presence for Lite XL (display file editing in Discord)"
  (
    mkPluginSingleFileInExternalRepo {
      name = "lorem";
      description = "Generates Lorem Ipsum placeholder dummy text";
    }
  )
  (let
    lspconfigs = mapAttrsToList (name: packages: {inherit name packages;}) {
      "bashls" = [pkgs.nodePackages.bash-language-server];
      "ccls" = [pkgs.ccls];
      "clangd" = [pkgs.clang_13];
      "clojure_lsp" = [pkgs.clojure-lsp];
      "cssls" = [pkgs.nodePackages.vscode-css-languageserver-bin];
      "dartls" = [pkgs.dart];
      "dockerls" = [pkgs.nodePackages.dockerfile-language-server-nodejs];
      "flow" = [pkgs.flow];
      "gopls" = [pkgs.gopls];
      "groovyls" = []; # Not found in nixpkgs
      "hls" = [pkgs.haskell-language-server];
      "html" = [pkgs.nodePackages.vscode-html-languageserver-bin];
      "intelephense" = [pkgs.nodePackages.intelephense];
      "jsonls" = [pkgs.nodePackages.vscode-json-languageserver];
      "kotlin_language_server" = [pkgs.kotlin-language-server];
      "nillsp" = []; # Not found in nixpkgs
      "nimlsp" = [pkgs.nimlsp];
      "ocaml_lsp" = [pkgs.ocamlPackages.ocaml-lsp];
      "pyls" = []; # Not found in nixpkgs
      "sveltels" = [pkgs.nodePackages.svelte-language-server];
      "pylsp" = [];
      "rls" = [pkgs.rls];
      "rust_analyzer" = [pkgs.rust-analyzer];
      "solargraph" = [pkgs.rubyPackages.solargraph];
      "sqlls" = []; # Not found in nixpkgs
      "sumneko_lua" = [pkgs.sumneko-lua-language-server];
      "tsserver" = [pkgs.nodePackages.typescript-language-server];
      "vimls" = [pkgs.nodePackages.vim-language-server];
      "vls" = []; # Not found in nixpkgs
      "yamlls" = [pkgs.nodePackages.yaml-language-server];
      "zls" = [pkgs.zls];
    };
  in rec {
    name = "lsp";
    description = "Provides code completion (also known as IntelliSense) using the Language Server Protocol";
    options = {
      options.programs.lite-xl.plugins.lsp = mkEnableOption description;
      options.programs.lite-xl.lsp = builtins.listToAttrs (map (c: {
          name = c.name;
          value = mkEnableOption "";
        })
        lspconfigs);
    };
    config = mkIf (cfg.plugins.lsp || any (c: cfg.lsp.${c.name}) lspconfigs) (mkMerge [
      {
        home.file."${pluginDirectory}/lsp" = {
          recursive = true;
          source = externalRepos.lsp;
        };
      }

      (mkIf cfg.lsp.groovyls {warnings = ["groovyls was not found in nixpkgs you have install it on your own!"];})
      (mkIf cfg.lsp.pyls {warnings = ["pyls was not found in nixpkgs you have install it on your own!"];})
      (mkIf cfg.lsp.sqlls {warnings = ["sqlls was not found in nixpkgs you have install it on your own!"];})
      (mkIf cfg.lsp.vls {warnings = ["vls was not found in nixpkgs you have install it on your own!"];})
      (mkIf cfg.lsp.nillsp {warnings = ["nil was not found in nixpkgs you have install it on your own!"];})

      (mkIf (any (c: cfg.lsp.${c.name}) lspconfigs) {
        programs.lite-xl.hm-module-plugin-before = ''local lspconfig = require "plugins.lsp.config"'';
      })

      {
        programs.lite-xl.hm-module-plugin = concatStrings (map (c:
          if cfg.lsp.${c.name}
          then "lspconfig.${c.name}.setup()\n"
          else "")
        lspconfigs);
      }

      (mkMerge (map (c: mkIf cfg.lsp.${c.name} {home.packages = c.packages;}) lspconfigs))
    ]);
  })
  rec {
    name = "lspkind";
    description = "Completion menu kind/type icons for Lite XL LSP";
    options = pluginEnableOption name description;
    config = mkIf cfg.plugins.lspkind {
      home.file."${pluginDirectory}/lspkind/init.lua".source = "${externalRepos.lspkind}/init.lua";
      home.file."${pluginDirectory}/autocomplete.lua".source = "${externalRepos.lspkind}/autocomplete.lua";
    };
  }
  (
    mkSimplePlugin {
      name = "macmodkeys";
      description = "Remaps mac modkeys `command/option` to `ctrl/alt`";
    }
  )
  (
    mkSimplePlugin {
      name = "markers";
      description = "Add markers to docs and jump between them quickly *([screenshot](https://user-images.githubusercontent.com/3920290/82252149-5faaa200-9946-11ea-9199-bea2efb7ee23.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "memoryusage";
      description = "Show memory usage in the status view";
    }
  )
  (
    mkSimplePlugin {
      name = "minimap";
      description = "Shows a minimap on the right-hand side of the docview. Taken from [@andsve](https://github.com/andsve/lite-plugins/tree/minimap-plugin), and improved upon.";
    }
  )
  (
    mkSimplePlugin {
      name = "motiontrail";
      description = "Adds a motion-trail to the caret *([gif](https://user-images.githubusercontent.com/3920290/83256814-085ccb00-a1ab-11ea-9e35-e6633cbed1a9.gif))*";
    }
  )
  (
    mkSimplePlugin {
      name = "navigate";
      description = "Allows moving back and forward between document positions, reducing the amount of scrolling";
    }
  )
  (
    mkSimplePlugin {
      name = "nonicons";
      description = "File icons set for TreeView.";
      extraConfig = {home.file."${configDirectory}/fonts/nonicons.ttf".source = "${externalRepos.nonicons_font}/dist/nonicons.ttf";};
    }
  )
  (
    mkSimplePlugin {
      name = "opacity";
      description = "Change the opaqueness/transparency of `lite-xl` using shift+mousewheel or a command.";
    }
  )
  (
    mkSimplePlugin {
      name = "open_ext";
      description = "Automatically prompts you if you tried to open a binary file in the editor";
    }
  )
  (
    mkSimplePlugin {
      name = "openfilelocation";
      description = "Opens the parent directory of the current file in the file manager";
    }
  )
  (
    mkSimplePlugin {
      name = "openselected";
      description = "Opens the selected filename or url";
    }
  )
  (
    mkSimplePlugin {
      name = "pdfview";
      description = "PDF preview for TeX files";
    }
  )
  (
    mkSimplePlugin {
      name = "primary_selection";
      description = "Adds middle mouse click copy/paste (primary selection). To use this plugin, `xclip` must be installed.";
    }
  )
  rec {
    name = "profiler";
    description = "Adds the ability to profile lite-xl with the [lua-profiler](https://github.com/charlesmallah/lua-profiler)";
    options = pluginEnableOption name description;
    config = mkIf cfg.plugins.profiler {
      home.file."${pluginDirectory}/profiler/init.lua".source = "${lite-xl-plugins}/plugins/profiler/init.lua";
      home.file."${pluginDirectory}/profiler/profiler.lua".source = "${lite-xl-plugins}/plugins/profiler/profiler.lua";
    };
  }
  (
    mkSimplePlugin {
      name = "rainbowparen";
      description = "Show nesting of parentheses with rainbow colours";
    }
  )
  (
    mkSimplePlugin {
      name = "regexreplacepreview";
      description = "Allows for you to write a regex and its replacement in one go, and live preview the results.";
    }
  )
  (
    mkSimplePlugin {
      name = "restoretabs";
      description = "Keep a list of recently closed tabs, and restore the tab in order on cntrl+shift+t.";
    }
  )
  (
    mkSimplePlugin {
      name = "scalestatus";
      description = "Displays current scale (zoom) in status view (depends on scale plugin)";
    }
  )
  (
    mkSimplePlugin {
      name = "select_colorscheme";
      description = "Select a color theme, like VScode, Sublime Text.(plugin saves changes)";
    }
  )
  (
    mkSimplePlugin {
      name = "selectionhighlight";
      description = "Highlights regions of code that match the current selection *([screenshot](https://user-images.githubusercontent.com/3920290/80710883-5f597c80-8ae7-11ea-97f0-76dfacc08439.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "settings";
      description = "Provides a GUI to manage core and plugin settings, bindings and select color theme *([video](https://user-images.githubusercontent.com/1702572/169743674-ececae24-f6b7-4ff2-bfa2-c4762cd327d9.mp4))*. (depends on [`widget`](https://github.com/lite-xl/lite-xl-widgets))";
      extraConfig = {programs.lite-xl.plugins.widget = true;};
    }
  )
  (
    mkSimplePlugin {
      name = "smallclock";
      description = "Displays the current time in the corner of the status view";
    }
  )
  (
    mkSimplePlugin {
      name = "smoothcaret";
      description = "Smooth caret animation *([gif](https://user-images.githubusercontent.com/20792268/139006049-a0ba6559-88cb-49a7-8077-4822445b4a1f.gif))*";
    }
  )
  (
    mkSimplePlugin {
      name = "sort";
      description = "Sorts selected lines alphabetically";
    }
  )
  (
    mkSimplePlugin {
      name = "spellcheck";
      description = "Underlines misspelt words *([screenshot](https://user-images.githubusercontent.com/3920290/79923973-9caa7400-842e-11ea-85d4-7a196a91ca50.png))* *-- note: on Windows a [`words.txt`](https://github.com/dwyl/english-words/blob/master/words.txt) dictionary file must be placed beside the exe*";
    }
  )
  (
    mkSimplePlugin {
      name = "statusclock";
      description = "Displays the current date and time in the corner of the status view";
    }
  )
  (
    mkSimplePlugin {
      name = "tabnumbers";
      description = "Displays tab numbers from 1–9 next to their names \*([screenshot](https://user-images.githubusercontent.com/16415678/101285362-007a8500-37e5-11eb-869b-c10eb9d9d902.png))";
    }
  )
  (
    mkSimplePlugin {
      name = "texcompile";
      description = "Compile Tex files into PDF";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "theme16";
      description = "Theme manager with base16 themes";
    }
  )
  (
    mkSimplePlugin {
      name = "themeselect";
      description = "Select a theme based on filename of active document";
    }
  )
  (
    mkSimplePlugin {
      name = "titleize";
      description = "Titleizes selected string (`hello world` => `Hello World`)";
    }
  )
  rec {
    name = "todotreeview";
    description = "Todo tree viewer for annotations in code like `TODO`, `BUG`, `FIX`, `IMPROVEMENT`";
    options = pluginEnableOption name description;
    config = mkIf cfg.plugins.todotreeview {
      home.file."${pluginDirectory}/todotreeview-xl.lua".source = "${externalRepos.todotreeview}/todotreeview-xl.lua";
    };
  }
  (
    mkSimplePlugin {
      name = "togglesnakecamel";
      description = "Toggles symbols between `snake_case` and `camelCase`";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "treeview-menu-extender";
      description = "Extend Lite XL's treeview menu *([screenshot](https://raw.githubusercontent.com/juliardi/lite-xl-treeview-menu-extender/main/screenshot.png))*";
    }
  )
  (
    mkSimplePlugin {
      name = "typingspeed";
      description = "Displays your current typing speed in characters and words per minute in the status bar";
    }
  )
  (
    mkSimplePlugin {
      name = "unboundedscroll";
      description = "Allows scrolling outside the bounds of a document";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "updatechecker";
      description = "Automatically checks for updates and notifies you";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "vibe";
      description = "VI(vim?) bindings with a hint of DOOM Emacs, for lite-xl";
    }
  )
  (
    mkSimplePluginExternalRepo {
      name = "visu";
      description = "Audio visualizer for Lite XL";
    }
  )
  rec {
    name = "widget";
    description = "Plugin library that provides a set of re-usable components to more easily write UI elements for your plugins";
    options = pluginEnableOption name description;
    config = mkIf cfg.plugins.widget {
      home.file."${configDirectory}/widget" = {
        recursive = true;
        source = externalRepos.widget;
      };
    };
  }
  (
    mkSimplePlugin {
      name = "wordcount";
      description = "Adds in a word count to the statusview.";
    }
  )
]
