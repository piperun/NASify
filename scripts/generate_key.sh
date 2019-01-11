#!/usr/bin/env bash

. ./utils.sh

ansi_privatefile() {
		check_file ./ansible/private.yaml 
		local var=$?
		if [ $var -eq 1 ]; then
				ansible-vault --vault-password-file=./ansible/ansible.key create ./ansible/private.yaml
		fi
}

# Generates a 256 byte key
generatekey() {
		check_file ./ansible/ansible.key
		local var=$?
		if [ $var -eq 1 ]; then
				local key=$(dd if=/dev/urandom of=./ansible/ansible.key bs=256  count=1)
		fi
}


