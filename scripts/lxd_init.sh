txt_remote() {
		echo "You will now connect to the NAS and setup lxd afterwards the installation will continue"
		echo "Afterwards there should be a file called: lxd_var in /tmp"
		echo "You can safely ignore/remove this file after the installation is fully complete"
}

lxd_init() {

		#	!! NOTICE !!
		#	Since this is the first version, this is lazily taken from ansible/hosts
		#	As such at the moment it'll take only 1 IP address, this will change later on
		#   into an array that will go through each one.
		#
		local ip=$(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ./ansible/hosts)
		local user=$( grep -oP '(?<=ansible_user=)\w+'  ./ansible/hosts)
		ssh -t $user@$ip 'sudo lxd init'

}



check_lxd_init() {
		if [ ! -f /tmp/lxd_var ]; then
				lxd_init
				touch /tmp/lxd_var

		else
				echo "lxd init has already been run, skipping"
		fi

}



