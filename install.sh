#!/usr/bin/env bash

. ./scripts/generate_key.sh
. ./scripts/lxd_init.sh
. ./scripts/utils.sh

ansi_init() {
		#local sudopass=$(sed -n -e 's/^\SUDO=//p' < sudopass)
		ansi_privatefile
		ansible-playbook -i ./ansible/hosts --vault-password-file=./ansible/ansible.key --extra-vars '@./ansible/private.yaml' ansible/tasks/init.yaml

		echo "initialization complete"

}

ansi_lxd() {
		ansible-playbook -vv -i ./ansible/hosts --vault-password-file=./ansible/ansible.key --extra-vars '@./ansible/private.yaml' ansible/tasks/lxd.yaml
}

copy_local() {
		ansible-playbook -i ./ansible/hosts --vault-password-file=./ansible/ansible.key --extra-vars '@./ansible/private.yaml' ansible/tasks/copy.yaml
}


tar_config() {
		check_file ./config.tar.gz
		local var=$?
		if [ $var -eq 1 ]; then
				local conftar=$(tar -zcvf config.tar.gz config/)
		fi

}

main() {
		# pre-install setup
		generatekey
		ansi_init
		txt_remote
		check_lxd_init

		# Create rutorrent container
		ansi_lxd
		#copy_local
		tar_config

}

main
