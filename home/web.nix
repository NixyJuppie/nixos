{ pkgs, ... }:

{
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
      ];
      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "RSS";
              url = "http://192.168.0.200:";
            }
          ];
        }
      ];
      settings = {
        "extensions.pocket.enabled" = false;
        "signon.rememberSignons" = false;
      };
    };
  };
}
