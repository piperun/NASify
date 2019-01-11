check_file() {
		if [ ! -f $1 ]; then
				return 1
		else
				return 0
		fi
}


