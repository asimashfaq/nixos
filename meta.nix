# Options of configuration

{ config, pkgs, lib, ... }: {
  config.meta = {
    users = {
      ash = {
        enable = true;
        battery = "BAT0";
        power = "AC";
        network-interface = "wlp0s20f3";
        extraPackages = with pkgs; [
          deluge
          zoom-us
          thunderbird
          spotify
          firefox
          tdesktop
          minecraft
          virtmanager
          texlive.combined.scheme-full
          steam
          evince
        ];
      };
    };

    devices = {
      x1c7 = {
        enable = true;
        # Choose "howdy", "fprintd", or null.
        bio-auth = "howdy";
      };
    };

    system = {
      hostname = "nixos";
      # Use TUNA Mirror together with original cache because TUNA has better performance inside Mainland China.
      # Set the list to `[ ]` to use official cache only.
      binaryCaches =
        [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
      proxy = {
        user =
          "ash"; # The user who would run the transparent proxy systemd service
        address = "127.0.0.1";
        localPort = 1080;
        redirPort = 1081;
      };
      # Choose ibus engines to apply
      ibus-engines = with pkgs.ibus-engines; [ libpinyin ];
    };
  };
}