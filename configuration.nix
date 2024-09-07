{ config, pkgs, ... }:
{
  imports = [
    ./vpsadminos.nix
    ./users.nix
    ./services/default.nix
    ./system-packages.nix
  ];
  systemd.extraConfig = ''
    DefaultTimeoutStartSec=900s
  '';
  time.timeZone = "Europe/Warsaw";
  system.stateVersion = "24.11";
}
