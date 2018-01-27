This is a WIP but the basic idea is to allow users to easily deploy a NAS server without having to rewrite their configuration files over and over again.



##TODO:

	* Add SAMBA configs
	* Linux optimizations confs
	* Misc stuff
	* Stuff I've missed
	* Ansible

---

##VERSION GOALS:

###V1:

Make sure everything works on a fresh machine as is 

---

###V2:

	* Add rtinst as a quick bandaid

	* Create script for basic self-deployment (either via Ansible or own script)

---

###V3:

	* Add support for SAMBA
	* User OS dependent configuration (SAMBA for Windows, SSHFS/NFS for Linux/BSD)
	* Give choice between vsftpd and SFTP/SCP
	* Add support for LDAP if needed
	* Add support for Kerberos if needed

**Maybe**:
	* Rule out rutorrent for flood, if user has enough space
	* Add support for streaming
	* Add support for torque
	* Add support for screen
---
