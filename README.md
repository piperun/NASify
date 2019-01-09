
Still very much WIP, however the config files should be enough to start rtorrent + rutorrent.

NASify is a "roll your own" toolkit to deploy a basic container based NAS server.

To do this we're using [lxd](https://linuxcontainers.org/lxd/introduction/) instead of Docker due to it's more flexible but powerful out-of-the-box enviroment.




NASify uses the Alpine linux (3.8) amd64 image, but you can switch distro and or version but you'll need to fix any upcoming errors yourself.

Note: It is highly recommended you get accustom to the tools used in NASify before trying NASify.

Since rtorrent now support somewhat daemon/headless mode (you still have to make it run in the background), tmux/screen isn't required as of 0.9+


## Requirements:
* Linux host (BSD not supported, but can be ported to work with BSD jails)
* Ansible
* SSH access to NAS
* lxd
* rtorrent 0.9+ (for daemon mode)


# Packages:
These are the packages NASify utilizes:

* Samba
* Nginx
* Ansible (not installed inside the container)
* sftp or vsftpd (optional)
* rtorrent
* rutorrent
* lxd



## TODO:

* Add SAMBA configs
* Linux optimizations confs
* Misc stuff
* Stuff I've missed
* Ansible


## VERSION GOALS:

### V1:

* Make sure everything works on a fresh machine as is 
* Create basic Ansible deployment script
* 

---

### V2:
* Add support for SAMBA
* Give choice between vsftpd and SFTP/SCP
* Add HTTPS for nginx

### Down the line:
Add support for:

* plex
* couchpotato

### Maybe:
Add support for:

* flood
* streaming (might not be needed given you can play over sshfs/SAMBA)
* torque (unlikely)
* screen/tmux (likely not needed anymore)
* LDAP 
* Kerberos 
---
