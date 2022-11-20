{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.lite-xl;
  configDirectory = "${config.xdg.configHome}/lite-xl";

  colorsDirectory = "${configDirectory}/colors";

  lite-xl-colors = import ./repos/lite-xl-colors.nix {inherit pkgs;};

  allColors = builtins.fromJSON (builtins.readFile ./info/colors.json);

  plugins = import ./plugin-configuration.nix {inherit pkgs lib config;};

  options' = {
    options.programs.lite-xl.enable = mkEnableOption "Lite XL";

    options.programs.lite-xl.package = mkOption {
      type = types.package;
      default = pkgs.lite-xl;
    };

    options.programs.lite-xl.colors = builtins.listToAttrs (map (c: {
        name = c.name;
        value = mkEnableOption "${c.name} theme";
      })
      allColors);

    options.programs.lite-xl.hm-module-plugin-before = mkOption {
      type = types.lines;
      default = "";
    };

    options.programs.lite-xl.hm-module-plugin = mkOption {
      type = types.lines;
      default = "";
    };

    options.programs.lite-xl.hm-module-plugin-after = mkOption {
      type = types.lines;
      default = "";
    };
  };
in
  (foldl' recursiveUpdate options' (map (p: p.options) plugins))
  // {
    config = mkIf cfg.enable (mkMerge [
      {home.packages = [cfg.package];}

      {
        home.file."${configDirectory}/plugins/hm-module.lua".text = ''
          -- mod-version:3

          -- hm-module-plugin-before
          ${cfg.hm-module-plugin-before}

          -- hm-module-plugin
          ${cfg.hm-module-plugin}

          -- hm-module-plugin-after
          ${cfg.hm-module-plugin-after}
        '';
      }

      (mkMerge (map (p: p.config) plugins))

      (mkMerge (map (colorTheme:
        mkIf cfg.colors.${colorTheme.name} {
          home.file."${colorsDirectory}/${colorTheme.name}.lua".source = "${lite-xl-colors}/${colorTheme.path}";
        })
      allColors))
    ]);
  }
