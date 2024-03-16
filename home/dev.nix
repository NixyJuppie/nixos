{ lib, pkgs, ... }:
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

    # mold linker
    mold
    clang
  ];

  home.file.".cargo/config.toml".text = lib.concatStringsSep "\n" [
    "[target.x86_64-unknown-linux-gnu]"
    "linker = 'clang'"
    "rustflags = ['-C', 'link-arg=-fuse-ld=${pkgs.mold}/bin/mold']"
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
    extensions = with pkgs.open-vsx; [
      mkhl.direnv
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
      belfz.search-crates-io
      serayuzgur.crates
      bungcip.better-toml
      redhat.vscode-yaml

      usernamehw.errorlens
      zhuangtongfa.material-theme
      pkief.material-icon-theme
    ];
    keybindings = [
      {
        "key" = "alt+enter";
        "command" = "editor.action.quickFix";
        "when" = "editorHasCodeActionsProvider && textInputFocus && !editorReadonly";
      }
      {
        "key" = "ctrl+.";
        "command" = "-editor.action.quickFix";
        "when" = "editorHasCodeActionsProvider && textInputFocus && !editorReadonly";
      }
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

      "rust-analyzer.references.excludeTests" = true;
      "rust-analyzer.lens.references.adt.enable" = true;
      "rust-analyzer.lens.references.trait.enable" = true;
      "rust-analyzer.lens.references.method.enable" = true;
      "rust-analyzer.lens.references.enumVariant.enable" = true;

      "redhat.telemetry.enabled" = false;
    };
  };
}
