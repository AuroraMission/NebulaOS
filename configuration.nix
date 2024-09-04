{ config, pkgs, ... }:
{
  imports = [
    ./vpsadminos.nix
    ./users.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    zellij
    nushell
    starship
    ripgrep
    yazi
    bat
    zoxide
    direnv
    croc

    zx
    bazel

    btop
    tshark
    rustscan
    aircrack-ng

    diskonaut

    mkpasswd

    cargo
  ];

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  #users.extraUsers.root.openssh.authorizedKeys.keys =
  #  [ "..." ];

  virtualisation.docker.enable = true;

  systemd.extraConfig = ''
    DefaultTimeoutStartSec=900s
  '';

  time.timeZone = "Europe/Warsaw";

  system.stateVersion = "24.11";
}
