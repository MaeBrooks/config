{
  description = "Mae's darwin nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    system-config = { pkgs, ... }: {
      environment.systemPackages = [];

      nixpkgs.hostPlatform = "aarch64-darwin";
      nix.settings.experimental-features = "nix-command flakes";

      system.stateVersion = 5;
      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.keyboard =
        { enableKeyMapping = true;
          remapCapsLockToControl = true;
          swapLeftCommandAndLeftAlt = true;
          swapLeftCtrlAndFn = true;
        };

      fonts.packages = with pkgs;
        [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        ];
    };
  in
  {
    # Build command: darwin-rebuild build --flake .#Maes-MacBook-Pro
    darwinConfigurations."Maes-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules =
        [ system-config
        ];
    };
  };
}
