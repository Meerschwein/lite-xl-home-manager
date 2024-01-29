{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = inputs @ {self, ...}: let
    lite-xl-pkg = pkgs: pkgs.callPackage ./lite-xl.nix {};
    lite-xl-overlay = final: prev: {lite-xl = lite-xl-pkg prev;};
  in
    inputs.utils.lib.mkFlake
    {
      inherit self inputs;

      homeModules.lite-xl = import ./default.nix;

      outputsBuilder = channels: let
        pkgs = channels.nixpkgs;
      in {
        packages.lite-xl = lite-xl-pkg pkgs;
        apps.lite-xl = inputs.utils.lib.mkApp {drv = lite-xl-pkg pkgs;};
        overlays.lite-xl = lite-xl-overlay;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nushell
            nix-prefetch-git
            go
            gopls
            delve
            io

            # Formatting
            treefmt
            alejandra
            gofumpt
          ];
        };
      };
    };
}
