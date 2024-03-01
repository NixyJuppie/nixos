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
sudo git clone https://github.com/NixyJuppie/nixos /mnt/etc/nixos
sudo nixos-generate-config --no-filesystems --show-hardware-config | sudo tee /mnt/etc/nixos/hardware-configuration.nix
sudo nixos-install --flake /mnt/etc/nixos#nixos
sudo nixos-enter -c "passwd user"
reboot
```
