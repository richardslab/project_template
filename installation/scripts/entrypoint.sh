#!/usr/bin/env bash
echo "in entrypoint.sh"

if [ $# -eq 0 ]; then 
	echo "bash starting up, please be patient."
	bash
else 
	echo "$@"
fi