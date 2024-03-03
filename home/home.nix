{ lib, pkgs, settings, ... }:
{
  imports = [ ./plasma.nix ./web.nix ./dev.nix ./gaming.nix ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "beeper"
      "spotify"
    ];

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";
  home.packages = with pkgs; [ neofetch beeper spotify spotify-tray ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };
  programs.starship.enable = true;
  programs.nix-index.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
