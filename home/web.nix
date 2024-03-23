{ pkgs, ... }:
{
  home.packages = with pkgs; [ protonvpn-gui ungoogled-chromium ];

  home.file.".config/Proton/VPN/settings.json".text = ''
    {
      "protocol": "openvpn-udp",
      "killswitch": 1,
      "dns_custom_ips": [],
      "features": {
          "netshield": 2,
          "moderate_nat": false,
          "vpn_accelerator": true,
          "port_forwarding": false
      }
    }'';

  home.file.".config/Proton/VPN/app-config.json".text = ''
    {
      "tray_pinned_servers": [ "PL", "CH", "NL", "IT", "UK", "US" ],
      "connect_at_app_startup": "FASTEST"
    }'';

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        proton-pass
        libredirect
        plasma-integration
      ];
      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "Mail";
              url = "https://mail.proton.me/u/0/inbox";
            }
            {
              name = "GitHub";
              url = "https://github.com";
            }
            {
              name = "RSS";
              url = "http://192.168.0.200:1000";
            }
            {
              name = "Nemesis Backlog";
              url = "https://github.com/users/NixyJuppie/projects/7";
            }
          ];
        }
      ];
      search = {
        engines = {
          "Brave" = {
            urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
            iconUpdateURL = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "b" ];
          };
          # Name must be different from the builtin one
          "Google (cringe)" = {
            urls = [{ template = "https://www.google.com/search?q={searchTerms}"; }];
            iconUpdateURL = "https://www.google.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "g" ];
          };
        };
        order = [ "Brave" "Google (cringe)" ];
        default = "Brave";
        privateDefault = "Brave";
        force = true;
      };
      settings = {
        "browser.toolbars.bookmarks.visibility" = "always";
        "extensions.pocket.enabled" = false;
        "signon.rememberSignons" = false;
      };
    };
  };
}
