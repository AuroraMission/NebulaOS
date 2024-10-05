{ config, pkgs, ... }:
{
  imports = [
    ./vpsadminos.nix
    ./users.nix
    ./services/default.nix
    ./system-packages.nix
    ./networking.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.nix-ld.enable = true;
  nixpkgs.config.allowUnfree = true;
  systemd.extraConfig = ''
    DefaultTimeoutStartSec=900s
  '';

  services = {
    desktopManager.plasma6 = {
      enable = true;
    };
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  services.xrdp.enable = true;
services.xrdp.defaultWindowManager = "startplasma-x11";
services.xrdp.openFirewall = true;

  time.timeZone = "Europe/Warsaw";
  system.stateVersion = "24.11";
}
