# NixOS Config

## NixOS Installation
### Partitioning
```bash
echo "PASSWORD" > /tmp/secret.key
curl https://raw.githubusercontent.com/NixyJuppie/nixos/develop/disko.nix > ~/disko.nix
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ~/disko.nix
```
### Installation
```bash
sudo nix-channel --add https://channels.nixos.org/nixos-unstable nixos
sudo git clone https://github.com/NixyJuppie/nixos /mnt/etc/nixos
sudo nixos-install
reboot
```
