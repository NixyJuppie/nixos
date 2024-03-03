{ lib, pkgs, settings, ... }:

{
  imports = [ ./hardware.nix ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Xbox One Wireless Controller 
  hardware.xpadneo.enable = true;

  # Networking
  networking.hostName = settings.hostname;
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pl";
  };

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Desktop
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Packagess
  environment.systemPackages = with pkgs; [
    git
    gamemode
    virtiofsd
  ];

  # Shells
  programs.fish.enable = true;

  # Steam
  programs.steam.enable = true;

  # Users
  users.users.${settings.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "23.11";
}
