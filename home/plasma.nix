{ lib, pkgs, inputs, settings, ... }:
{
  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

  home.packages = with pkgs; [ kcolorchooser ];

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        saveAfterCopy = true;
        savePath = "/home/${settings.username}/Pictures/Screenshots";
        filenamePattern = "Screenshot_%F_%H-%M-%S";
      };
    };
  };

  programs.plasma = {
    enable = true;

    windows.allowWindowsToRememberPositions = true;

    kwin.titlebarButtons = {
      left = [ "more-window-actions" "keep-above-windows" ];
      right = [ "minimize" "maximize" "close" ];
    };

    workspace = {
      clickItemTo = "select";
      wallpaper = "${./desktop.png}";
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      cursorTheme = "Breeze";
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "breeze-dark";
    };

    shortcuts = {
      kwin.Overview = "Meta+Tab";
      kwin."Window Fullscreen" = "Meta+Shift+Return";

      mediacontrol.nextmedia = [ "Media Next" "Shift+Volume Up" ];
      mediacontrol.previousmedia = [ "Media Previous" "Shift+Volume Down" ];
      mediacontrol.mediavolumedown = "Ctrl+Volume Down";
      mediacontrol.mediavolumeup = "Ctrl+Volume Up";
      kmix.mic_mute = [ "Microphone Mute" "Shift+Volume Mute" ];

      "services.org.flameshot.Flameshot.desktop"."Capture" = "Meta+Shift+S";
      "services.org.kde.plasma-systemmonitor.desktop"._launch = "Ctrl+Shift+Esc";
    };

    configFile = {
      # Keyboard
      kxkbrc.Layout = {
        Use = true;
        LayoutList = "pl";
      };

      kdeglobals = {
        KDE.AnimationDurationFactor = 0.35;
        General = {
          AccentColor = "180,110,228";
          fixed = "JetBrains Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        };
      };

      kscreenlockerrc.Daemon = {
        Autolock = false;
        LockOnResume = true;
      };

      ksmserverrc.General.loginMode = "emptySession";

      # Screen Edges layout (9 - disabled):
      # 7 - 8 - 1
      # 6 -   - 2
      # 5 - 4 - 3
      kwinrc.Effect-overview.BorderActivate = 9;
      kwinrc.Plugins.wobblywindowsEnabled = true;
      kwinrc.ModifierOnlyShortcuts.Meta = "org.kde.krunner,/App,,toggleDisplay";

      krunnerrc.General.ActivateWhenTypingOnDesktop = false;
      krunnerrc.General.FreeFloating = true;

      konsolerc."Desktop Entry".DefaultProfile = "User.profile";
    };

    startup.autoStartScript.beeper.text = "sh -c '${pkgs.beeper}/bin/beeper --hidden' &";
    startup.autoStartScript.protonvpn.text = "sh -c '${pkgs.protonvpn-gui}/bin/protonvpn-app' &";
    startup.autoStartScript.spotify.text = "sh -c '${pkgs.spotify}/bin/spotify --minimized' &";
  };

  # https://github.com/pjones/plasma-manager/pull/69
  home.file.".local/share/konsole/User.profile".text = lib.concatStringsSep "\n" [
    "[Appearance]"
    "ColorScheme=Breeze"
    "Font=JetBrains Mono,14,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

    "[General]"
    "Command=/run/current-system/sw/bin/fish"
    "Name=User"
    "Parent=FALLBACK/"

    "[Scrolling]"
    "HistoryMode=2"
  ];

  home.file.".local/share/konsole/Breeze.colorscheme".text = lib.concatStringsSep "\n" [
    "[Background]"
    "Color=35,38,39"
    "[BackgroundFaint]"
    "Color=49,54,59"
    "[BackgroundIntense]"
    "Color=0,0,0"
    "[Color0]"
    "Color=35,38,39"
    "[Color0Faint]"
    "Color=49,54,59"
    "[Color0Intense]"
    "Color=127,140,141"
    "[Color1]"
    "Color=237,21,21"
    "[Color1Faint]"
    "Color=120,50,40"
    "[Color1Intense]"
    "Color=192,57,43"
    "[Color2]"
    "Color=17,209,22"
    "[Color2Faint]"
    "Color=23,162,98"
    "[Color2Intense]"
    "Color=28,220,154"
    "[Color3]"
    "Color=246,116,0"
    "[Color3Faint]"
    "Color=182,86,25"
    "[Color3Intense]"
    "Color=253,188,75"
    "[Color4]"
    "Color=29,153,243"
    "[Color4Faint]"
    "Color=27,102,143"
    "[Color4Intense]"
    "Color=61,174,233"
    "[Color5]"
    "Color=155,89,182"
    "[Color5Faint]"
    "Color=97,74,115"
    "[Color5Intense]"
    "Color=142,68,173"
    "[Color6]"
    "Color=26,188,156"
    "[Color6Faint]"
    "Color=24,108,96"
    "[Color6Intense]"
    "Color=22,160,133"
    "[Color7]"
    "Color=252,252,252"
    "[Color7Faint]"
    "Color=99,104,109"
    "[Color7Intense]"
    "Color=255,255,255"
    "[Foreground]"
    "Color=252,252,252"
    "[ForegroundFaint]"
    "Color=239,240,241"
    "[ForegroundIntense]"
    "Color=61,174,233"
    "[General]"
    "Anchor=0.5,0.5"
    "Blur=true"
    "ColorRandomization=false"
    "Description=Breeze"
    "FillStyle=Tile"
    "Opacity=0.85"
    "Wallpaper="
    "WallpaperFlipType=NoFlip"
    "WallpaperOpacity=1"
  ];
}
