#!/bin/bash --login
echo "in entrypoint.sh"

conda activate -n analysis

# this is the entrypoint script. Currently it will print out the arguments.
# this is probably NOT what you want the docker image to do...so this is where you're creative genious comes into play. 
# figure out what you want the docker image to do when invoked and plop it all here. 

echo "$@"
