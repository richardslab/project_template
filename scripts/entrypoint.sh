#!/usr/bin/env bash
echo "in entrypoint.sh"

if [ $# -eq 0 ]; then 
	echo Please be patient as it takes some time to activate the conda environment
	bash
else 
	echo "$@"
fi