{ config, pkgs, ... }:
{
  users.groups.signoz = {};

  users.users.signoz = {
    uid = 3001;
    group = "signoz";
    extraGroups = [ "signoz" "podman" "wheel" ];
    isNormalUser = false;
    isSystemUser = true;
    home = "/service/signoz";
  };

  systemd.services.signoz = {
    enable = true;
    after  = [ "network.target" ]; 
    serviceConfig = {
      User = "signoz";
      Group = "signoz";
      ExecStart = "podman compose -f ${data/docker-compose.yaml} up";
      ExecStop = "podman compose -f ${data/docker-compose.yaml} down";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
    #after = [ "docker.service" "docker.socket" ];
    path = [ pkgs.podman pkgs.podman-compose ];
  };
}
