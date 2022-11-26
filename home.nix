{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sharris";
  home.homeDirectory = "/Users/sharris";

  home.packages = [
    pkgs.nodejs-18_x
    pkgs.jdk17_headless
    pkgs.maven
    pkgs.httpie
    pkgs.bashInteractive
    pkgs.powershell
    pkgs.ripgrep
    pkgs.htop
  ];

  home.file.".vimrc".source = ./vimrc;
  home.file.".editorconfig".source = ./editorconfig;

  programs.bash.enable = true;
  programs.zsh.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;


  # Git config using Home Manager modules
  programs.git = {
    enable = true;
    userName = "Stephen Harris";
    userEmail = "steveofar@hotmail.com";
    aliases = {
      c = "commit";
      co = "checkout";
      s = "status";
    };
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
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
