{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt

    gnupg
    git-credential-manager
  ];

  programs.git = {
    enable = true;
    userName = "NixyJuppie";
    userEmail = "git.nixy.carefully356@passfwd.com";
    signing.signByDefault = true;
    signing.key = "C3EE4037AE612391";
    extraConfig = {
      init.defaultBranch = "develop";
      credential = {
        credentialStore = "secretservice";
        helper = "git-credential-manager";
      };
    };
  };

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
}
