# Home Manager Config

## Installation
> [!WARNING]  
> These commands must be executed by a normal user.  
> If u want to use it from NixOS installer, u need to run `nixos-enter -c "su user"`

```bash
# Clone this repo
git clone https://github.com/NixyJuppie/home-manager ~/.config/home-manager
# Build config
nix run home-manager/master -- switch
```
