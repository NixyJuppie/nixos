<<<<<<< HEAD
# NixOS Config

> [!WARNING]  
> These commands must be executed as root to avoid permission issues.  
> Use `sudo su` to enter interactive root session instead of `sudo <command>`.

## Partitioning
```bash
# Set disk encryption password
echo "PASSWORD" > /tmp/secret.key
# Clone this repo
git clone https://github.com/NixyJuppie/nixos /tmp/nixos
# Format and partition disk (if you want to customize partition scheme, do it now)
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/nixos/disko.nix
```
## Installation
```bash
# Move config repo to /mnt/etc/nixos
mkdir /mnt/etc && sudo mv /tmp/nixos /mnt/etc/nixos
# Generate hardware config
nixos-generate-config --no-filesystems --show-hardware-config > /mnt/etc/nixos/hardware-configuration.nix
# Add config changes to git index (if you want to customize config before install, do it now)
git -C /mnt/etc/nixos add .
# Install NixOS
nixos-install --flake /mnt/etc/nixos#nixos
# Set user password
nixos-enter -c "passwd user"
```

## Home Manager
Home Manager configuration and guide lives in separate [git repository](https://github.com/NixyJuppie/home-manager).
=======
# Home Manager Config

## Installation
> [!WARNING]  
> These commands must be executed by an user named `user`.

```bash
# Clone this repo
git clone https://github.com/NixyJuppie/home-manager ~/.config/home-manager
# Build config
nix run home-manager/master -- switch
```
>>>>>>> home-manager/develop
