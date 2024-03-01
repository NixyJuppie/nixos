{ pkgs, nur, ... }:
{
  imports = [ ./desktop.nix ./web.nix ./dev.nix ./gaming.nix ];

  nixpkgs = {
    overlays = [ nur.overlay ];
  };

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.packages = with pkgs; [
    vulkan-tools
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
