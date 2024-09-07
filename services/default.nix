{ config, pkgs, ... }:
{
  imports = [
    ./ssh/default.nix
    ./podman/default.nix
    ./signoz/default.nix
  ];
}
