{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;

  # Useful other development tools
  environment.systemPackages = with pkgs; [
    docker-compose # start group of containers for dev
  ];
}
