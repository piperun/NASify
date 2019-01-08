#!/usr/bin/env bash

. ./scripts/generate_key.sh
. ./scripts/lxd_init.sh

ansi_init() {
		#local sudopass=$(sed -n -e 's/^\SUDO=//p' < sudopass)
		ansi_privatefile
		ansible-playbook -i ./ansible/hosts --vault-password-file=./ansible/ansible.key --extra-vars '@./ansible/private.yaml' ansible/tasks/init.yaml

		echo "initialization complete"

}

ansi_lxd() {
		ansible-playbook -i ./ansible/hosts -vv --vault-password-file=./ansible/ansible.key --extra-vars '@./ansible/private.yaml' ansible/tasks/lxd.yaml
}

main() {
		# pre-install setup
		generatekey
		#ansi_init
		txt_remote
		check_lxd_init

		# Create rutorrent container
		ansi_lxd

}

main
