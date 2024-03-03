# disko - Declarative disk partitioning
# https://github.com/nix-community/disko
{
  disko.devices = {
    disk = {
      master = {
        device = (import ../settings.nix).disk;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                passwordFile = "/tmp/secret.key";
                settings.allowDiscards = true;
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "root" = {
                      name = "root";
                      mountpoint = "/";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "home" = {
                      name = "home";
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "nix" = {
                      name = "nix";
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "swap" = {
                      name = "swap";
                      mountpoint = "/swap";
                      swap.swapfile.size = "8G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
