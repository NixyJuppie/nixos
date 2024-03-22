{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ protontricks protonup-qt ];

  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
  };
  home.file.".config/MangoHud/MangoHud.conf".text = lib.concatStringsSep "\n" [
    # Core
    "legacy_layout=false"
    "position=top-left"
    "no_display"

    # Visual
    "font_size=20"
    "text_color=ffffff"
    "text_outline"
    "text_outline_thickness = 1.0"
    "background_alpha=0.4"
    "background_color=020202"
    "round_corners=5"

    # Shortcuts
    "toggle_hud=Shift_R+F12"
    "toggle_hud_position=Shift_R+F11"

    # GPU
    "gpu_color=D21404"
    "gpu_text=GPU"
    "gpu_stats"
    "gpu_temp"

    # CPU
    "cpu_color=ED7117"
    "cpu_text=GPU"
    "cpu_stats"
    "cpu_temp"

    # RAM
    "ram_color=FFCC33"
    "ram"
    "swap"

    # FPS
    "fps"
    "engine_color=30AD23"
    "gamemode"
  ];
}
