{ pkgs, settings, ... }:
{
  imports = [ ./plasma.nix ./web.nix ./dev.nix ./gaming.nix ];

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";
  home.packages = with pkgs; [ neofetch beeper spotify spotify-tray unrar p7zip vlc ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };
  programs.starship.enable = true;
  programs.nix-index.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
