{ config, pkgs, fonts, ... }:

{
  # readonly - do not change
  home.stateVersion = "24.11";
  home.username = "zoft";
  home.homeDirectory = "/Users/zoft";
  home.file = {};

  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs;
    [ nerd-fonts.jetbrains-mono
      emacs30
      discord
      slack
      guile
      neofetch
      ripgrep
      unzip
      direnv
    ];

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;

    nix-direnv.enable = true;
  };
}
