{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "select";
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      cursorTheme = "Breeze";
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "breeze-dark";
    };
    shortcuts = {
      mediacontrol.nextmedia = [ "Media Next" "Shift+Volume Up" ];
      mediacontrol.previousmedia = [ "Media Previous" "Shift+Volume Down" ];
      kmix.mic_mute = [ "Microphone Mute" "Shift+Volume Mute" ];
      "services.org.kde.spectacle.desktop"._launch = "Print";
      "services.org.kde.spectacle.desktop".RectangularRegionScreenShot = [ "Meta+Shift+Print" "Meta+Shift+S" ];
    };
    configFile = {
      # Keyboard
      kxkbrc.Layout = {
        Use = true;
        LayoutList = "pl";
      };

      # Screen Edges layout (9 - disabled):
      # 7 - 8 - 1
      # 6 -   - 2
      # 5 - 4 - 3
      kwinrc.Effect-overview.BorderActivate = 9;

      spectaclerc = {
        General = {
          autoSaveImage = false;
          clipboardGroup = "PostScreenshotCopyImage";
          rememberSelectionRect = "Never";
        };
        ImageSave = {
          imageCompressionQuality = 100;
          imageFilenameTemplate = "Screenshot_<yyyy>-<MM>-<dd>_<hh>-<mm>-<ss>";
          translatedScreenshotsFolder = "Screenshots";
        };
      };

    };

    startup.autoStartScript.beeper.text = "${pkgs.beeper}/bin/beeper --hidden";
  };
}
