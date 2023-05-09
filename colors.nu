let colors_src = (nix-prefetch-git --quiet --url https://github.com/lite-xl/lite-xl-colors | from json)

let color_schemes = (
  ls -s $"($colors_src.path)/colors"
    | select name
    | rename filename
    | insert name {|it|
      $it.filename | parse --regex '(?P<name>.*)\.lua' | get name
    }
    | flatten
    )

let options = (
  $color_schemes
    | each {|it| $'($it.name) = mkEnableOption "($it.name)";'}
    | str join "\n"
    | $"options.programs.lite-xl.colors = {($in)};"
)

let configs = (
  $color_schemes
    | each {|it|
      $"\(mkIf cfg.colors.($it.name) {
        home.file.\".config/lite-xl/colors/($it.filename)\".source = \"${lite-xl-colors-src}/colors/($it.filename)\";
        programs.lite-xl.hm-module-plugin-before = ''local core = require \"core\"'';
        programs.lite-xl.hm-module-plugin = ''core.reload_module\(\"colors.($it.name)\")'';
      })"
    }
    | str join "\n"
    | $"config = mkIf cfg.enable \(mkMerge [($in)]);"
)

$'{config,lib,...}: with lib; let
  cfg = config.programs.lite-xl;
  lite-xl-colors-src = builtins.fetchGit {
    url = "($colors_src.url)";
    rev = "($colors_src.rev)";
  };
in {
  ($options)
  ($configs)
}'
| save -f colors.nix
