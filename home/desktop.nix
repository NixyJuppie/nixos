{ pkgs, ... }:
{
  home.packages = with pkgs; [
    flameshot
  ];

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
    };
    configFile = {
      kwinrulesrc.General.count = 1;
      # Flameshot fix
      kwinrulesrc.General.rules = "bc3369a1-9005-4113-96ec-3048e5174753";
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.Description = "Flameshot";
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.above = true;
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.aboverule = 3;
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.fullscreenrule = 3;
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.position = "0,0";
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.positionrule = 3;
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.wmclass = "flameshot";
      kwinrulesrc.bc3369a1-9005-4113-96ec-3048e5174753.wmclassmatch = 1;
    };
  };
}
