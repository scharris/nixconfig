# nix-channel --update 
# home-manager switch --flake ./#linux
#
{ config, pkgs, ... }:

let commonShellAliases =
  {
    gs = "git status";
    ga = "git add";
    gc = "git commit -m";
    gd = "git diff";
    gds = "git diff --staged";
    gdh = "git diff HEAD";
    kc = "kubectl";
  };
in
{
  home.username = "sharris";
  home.homeDirectory = if pkgs.stdenv.isLinux then "/home/sharris" else "/Users/sharris";

  manual.manpages.enable = false;

  home.packages = [
    pkgs.vim
    pkgs.git
    pkgs.nodejs-18_x
    pkgs.jdk17_headless
    pkgs.maven
    pkgs.kind
    pkgs.kubectl
    pkgs.httpie
    pkgs.bashInteractive
    pkgs.powershell
    pkgs.ripgrep
    pkgs.htop
    pkgs.nushell
    pkgs.httpie
  ];

  home.file.".vimrc".source = ./vimrc;
  home.file.".editorconfig".source = ./editorconfig;

  programs.bash = {
    enable = true;
    shellAliases = commonShellAliases;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "gentoo";
      plugins = [ "git" "cp" ];
    };
    shellAliases = commonShellAliases;
    initExtra = ''
      [ -f "/Users/sharris/.ghcup/env" ] && source "/Users/sharris/.ghcup/env" # ghcup-env%
    '';
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Git config using Home Manager modules
  programs.git = {
    enable = true;
    userName = "Stephen Harris";
    userEmail = "steveofar@hotmail.com";
    extraConfig = {
      pull.ff = "only";
      init.defaultBranch = "main";
    };
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
