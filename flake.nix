{
  description = "";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = inputs @ {self, ...}: let
    lite-xl-overlay = final: prev: {lite-xl = prev.callPackage ./lite-xl.nix {};};
  in
    inputs.utils.lib.mkFlake
    {
      inherit self inputs;

      nixosModules.lite-xl = import ./default.nix;
      nixosModules.default = import ./default.nix;

      outputsBuilder = channels: let
        pkgs = channels.nixpkgs;
      in {
        formatter = pkgs.treefmt;

        packages.lite-xl = pkgs.callPackage ./lite-xl.nix {};
        packages.default = pkgs.callPackage ./lite-xl.nix {};

        apps.update = inputs.utils.lib.mkApp {
          drv = pkgs.writeShellApplication {
            name = "update";
            runtimeInputs = with pkgs; [nix-prefetch-git nushell treefmt alejandra];
            text = ''
              nu ${./update.nu} && treefmt
            '';
          };
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nushell
            nix-prefetch-git

            # Formatting
            treefmt
            alejandra
          ];
        };
      };

      overlays.default = lite-xl-overlay;
      overlays.lite-xl = lite-xl-overlay;
    };
}
