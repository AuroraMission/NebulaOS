{ config, pkgs, ... }:
{
  imports = [
    ./ssh/default.nix
#    ./docker/default.nix
#    ./podman/default.nix
#    ./signoz/default.nix
    ./next-cloud/default.nix
#    ./nixos-hydra/default.nix
  ];
}
