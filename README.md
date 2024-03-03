# NixOS Config

## Installation
> [!WARNING]  
> These commands must be executed as root to avoid permission issues.  
> Use `sudo su` to enter interactive root session instead of `sudo <command>`.

### Partitioning
```bash
# Set disk encryption password
echo "PASSWORD" > /tmp/secret.key
# Clone this repo
git clone https://github.com/NixyJuppie/nixos /tmp/nixos
# Review and change settings
nano /tmp/nixos/settings.nix
# Format and partition disk
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/nixos/system/disko.nix
```

### Installation
```bash
# Move config repo to /mnt/etc/nixos
mkdir /mnt/etc && sudo mv /tmp/nixos /mnt/etc/nixos
# Generate hardware config
nixos-generate-config --no-filesystems --show-hardware-config > /mnt/etc/nixos/system/hardware.nix
# Add config changes to git index
git -C /mnt/etc/nixos add .
# Install NixOS (replace `HOSTNAME` with hostname from settings.nix)
nixos-install --flake /mnt/etc/nixos#
# Set user password (replace `USER` with username from settings.nix)
nixos-enter -c "passwd USER"
# Reboot and git gud
reboot
```
