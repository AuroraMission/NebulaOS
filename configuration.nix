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

    mkpasswd
  ];

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  #users.extraUsers.root.openssh.authorizedKeys.keys =
  #  [ "..." ];

  systemd.extraConfig = ''
    DefaultTimeoutStartSec=900s
  '';

  time.timeZone = "Europe/Amsterdam";

  system.stateVersion = "24.11";
}
