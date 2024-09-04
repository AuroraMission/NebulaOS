{ config, pkgs, lib, ... }:
with lib;
let test = [];
in {
  users.mutableUsers = false;

  users.groups.admins = {
    gid = 1000;
  };

  users.groups.services = {
    gid = 1001;
  };

  users.groups.apps = {
    gid = 1002;
  };

  users.users.inver = {
    uid = 2001;
    isNormalUser = true;
    isSystemUser = false;
    home = "/home/inver";
    description = "Inver's user";
    extraGroups = ["wheel" "networkmanager" "admins" "docker"];
    hashedPassword = "$6$gItze0OHtU/27oFc$vyqpLErFMN2MCvhW7ZQmkHBSIfxbGPqzv1CQpMux0O0pVpxZkTVza/1vrDx4inCpDbsW25.jMhJ4l5zgKNff/1";
    shell = pkgs.nushell;
  };
}
