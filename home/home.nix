{ lib, pkgs, ... }:
{
  imports = [ ./plasma.nix ./web.nix ./dev.nix ./gaming.nix ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "beeper"
    ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.packages = with pkgs; [ neofetch beeper ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };
  programs.starship.enable = true;
  programs.nix-index.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
