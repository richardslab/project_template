#!/usr/bin/env bash
echo "in entrypoint.sh"

conda activate analysis

if [ $# -eq 0 ]; then 
	bash
else 
	echo "$@"
fi