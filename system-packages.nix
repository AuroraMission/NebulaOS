{ config, pkgs, ... }:
{
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
}
