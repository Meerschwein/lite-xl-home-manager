{
  description = "";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = inputs @ {self, ...}:
    inputs.utils.lib.mkFlake {
      inherit self inputs;

      nixosModules.lite-xl = import ./default.nix;
      nixosModules.default = import ./default.nix;

      outputsBuilder = channels: let
        pkgs = channels.nixpkgs;
      in {
        formatter = pkgs.treefmt;

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
    };
}
