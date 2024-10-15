{ config, pkgs, lib, ... }:
{
  users.groups.signoz = {};

  users.users.signoz = {
    uid = 3001;
    group = "signoz";
    extraGroups = [ "docker" ];
    isNormalUser = false;
    isSystemUser = true;
  };

  systemd.services.signoz = {
    enable = true;
    #after  = [ "network.target" ]; 
    serviceConfig = {
      User = "root";
      Group = "wheel";
      ExecStart = "${pkgs.docker-compose}/bin/docker-compose -f ${data/docker-compose.yaml} up";
      ExecStop = "${pkgs.docker-compose}/bin/docker-compose -f ${data/docker-compose.yaml} down";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
    after = [ "docker.service" "docker.socket" ];
    #path = [ pkgs.docker-compose ];
  };
}
