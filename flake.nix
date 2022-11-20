{
  description = "";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = inputs @ {self, ...}:
    inputs.utils.lib.mkFlake {
      inherit self inputs;

      outputsBuilder = channels: let
        pkgs = channels.nixpkgs;
      in {
        formatter = pkgs.treefmt;
        homeManagerModules = import ./default.nix;

        devShell = pkgs.mkShell {
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
