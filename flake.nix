{
<<<<<<< HEAD
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, disko, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Disko
          disko.nixosModules.disko
          ./disko.nix

          # System
          ./configuration.nix
=======
  description = "Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nurpkgs.url = "github:nix-community/NUR";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

  outputs = { nixpkgs, nurpkgs, home-manager, plasma-manager, ... }: {
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          plasma-manager.homeManagerModules.plasma-manager
          ./home/home.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ nurpkgs.overlay ];
          })
>>>>>>> home-manager/develop
        ];
      };
    };
  };
}
