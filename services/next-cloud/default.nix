{ config, pkgs, lib, ... }:
{
  users.groups.nextcloud = {};

  users.users.nextcloud = {
    uid = 3002;
    group = "nextcloud";
    extraGroups = [ "docker" "wheel" ];
    isNormalUser = false;
    isSystemUser = true;
  };

  systemd.services.nextcloud = {
    enable = true;
    serviceConfig = {
      User = "nextcloud";
      Group = "docker";
      ExecStart = "${lib.getExe pkgs.docker} run --init --sig-proxy=false --name nextcloud-aio-mastercontainer --restart always -p 80:80 -p 8080:8080 -v nextcloud_aio_mastercontainer:/mnt/docker-aio-config -v /var/run/docker.sock:/var/run/docker.sock:ro nextcloud/all-in-one";
      ExecStop = "${lib.getExe pkgs.docker} stop nextcloud";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "docker.service" "docker.socket" ];
    path = [ pkgs.docker pkgs.docker-compose ];
  };
}
