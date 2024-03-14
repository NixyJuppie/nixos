{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # nix
    nil
    nixpkgs-fmt

    # git
    gnupg
    git-credential-manager
    github-desktop

    # font
    jetbrains-mono
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
        helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
      };
    };
  };

  programs.direnv.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
      bungcip.better-toml
      redhat.vscode-yaml

      usernamehw.errorlens
      zhuangtongfa.material-theme
      pkief.material-icon-theme
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "editor.minimap.enabled" = false;
      "editor.fontSize" = 18;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
      "terminal.integrated.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
      "terminal.integrated.defaultProfile.linux" = "fish";

      "workbench.colorTheme" = "One Dark Pro Darker";
      "workbench.iconTheme" = "material-icon-theme";

      "git.autofetch" = true;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;

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
