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
    nodejs_22

    btop
    tshark
    rustscan
    aircrack-ng

    diskonaut

    mkpasswd

    nasm
    cargo
    gcc
    glibc.static
    kmod
  ];
}
