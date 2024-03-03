{
  description = "Personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nurpkgs.url = "github:nix-community/NUR";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

  outputs = inputs @ { nixpkgs, nurpkgs, disko, home-manager, plasma-manager, ... }:
    let
      settings = import ./settings.nix;
      apply-overlays = ({
        nixpkgs.overlays = [ nurpkgs.overlay ];
        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
          "steam"
          "steam-original"
          "steam-run"
          "beeper"
          "spotify"
        ];
      });
      special-args = { inherit inputs settings; };
    in
    {
      nixosConfigurations = {
        ${settings.hostname} = nixpkgs.lib.nixosSystem {
          system = settings.system;
          specialArgs = special-args;
          modules = [
            apply-overlays

            disko.nixosModules.disko
            ./system/disko.nix
            ./system/system.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = special-args;
              home-manager.users.${settings.username}.imports = [
                apply-overlays
                ./home/home.nix
              ];
            }
          ];
        };
      };
    };
}
