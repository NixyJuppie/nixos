{ pkgs, nur, lib, ... }:
{
  imports = [ ./desktop.nix ./web.nix ./dev.nix ./gaming.nix ];

  nixpkgs.overlays = [ nur.overlay ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "beeper"
    ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.packages = with pkgs; [ beeper ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };
  programs.starship.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
