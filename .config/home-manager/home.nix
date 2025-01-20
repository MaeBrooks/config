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
      nodejs_20
      typescript-language-server
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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    envExtra = ''
      function gc() {
        git clone --depth 1 $@
        return $?
      }
      function gco() {
        git checkout $@
        return $?
      }
      function ggl() {
        git pull $@
        return $?
      }
      eval "$(~/.local/bin/mise activate)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };
}
