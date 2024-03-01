{ pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt

    # unfree
    # beeper
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      usernamehw.errorlens
    ];
    userSettings = {
      "editor.fontSize" = 18;
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
