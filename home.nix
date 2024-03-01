{ pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.packages = with pkgs; [
    beeper
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
